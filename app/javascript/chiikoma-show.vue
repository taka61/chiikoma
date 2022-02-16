<template>
  <div class="page">
    <div class="primary-section">
        <div class="primary-item">
          <div class="primary-text">
            {{ chiikomaTitle }}
          </div>
        </div>
    </div>

    <modal name="modal-thanks" :draggable="true" :resizable="true" width="80%" height="60%">
      <div class="modal-body is-centered">
        <i class="far fa-kiss-wink-heart fa-6x"></i>
        <h1 class="is-centered">
          ケアしてくれてありがとう!!
        </h1>
        <div class="center">
          <div class="message-body is-centered">
            今日も1日おつかれさま🌈
          </div>
        </div>
        <div class="field-button">
          <div class="control">
            <button
              class="button"
              type="button"
              @click="doneChiikoma">
              次へ
            </button>
          </div>
        </div>
        </div>

    </modal>

    <div class="list-section">
      <div class="list-text">
        困り度
      </div>
      <div class="list-item">
        {{ chiikomaLevel }}
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        経験する頻度
      </div>
      <div class="list-item">
        {{ chiikomaFrequency }}
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        対策コスト
      </div>
      <div class="list-item">
        {{ chiikomaCost }}
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        トータルポイント
      </div>
      <div class="list-item">
        {{ chiikomaTotalPoints }}
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        作成日
      </div>
      <div class="list-date-item">
        {{ chiikomaCreatedDate | moment }}
      </div>
    </div>

    <div class="field-button">
      <div class="control">
        <button
          class="button"
          type="button"
          @click="openModal">
          ケアした
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import moment from 'moment'

export default {
  filters: {
    moment: function(date) {
      return moment(date).format("MM月DD日");
    },
  },
  data() {
    return {
      chiikoma: [],
      chiikomaTitle: '',
      chiikomaLevel:'',
      chiikomaFrequency: '',
      chiikomaCost: '',
      chiikomaCreatedDate: '',
      chiikomaTotalPoints: '',
    }
  },
  computed: {},
  mounted () {
    this.getChiikoma()
  },
  methods: {
    getChiikoma () {
      const url = location.pathname.split('/')
      const path = url[url.length - 1]
      axios.get(`/api/chiikomas/${path}.json`)
      .then((response) => {
        this.chiikoma = response.data
        this.chiikomaTitle = response.data.title
        this.chiikomaLevel = response.data.level_of_problem
        this.chiikomaFrequency = response.data.frequency_of_experience
        this.chiikomaCost = response.data.cost_of_solution
        this.chiikomaCreatedDate = response.data.created_at
        this.chiikomaTotalPoints = response.data.total_points
      }, (error) => {
          console.log(error, response)
        })
    },
    openModal() {
      this.$modal.show('modal-thanks');
    },
    doneChiikoma() {
      const chiikomaUrl = location.pathname.split('/')
      const chiikomaID = chiikomaUrl[chiikomaUrl.length - 1]
      const requestPath = '/api/chiikomas/' + chiikomaID
      const today = new Date();
      axios.patch(requestPath , {
        done: true,
        solved_on: today
      }).then(response => (
        window.location.href ='/chiikomas/done'
      ))
    },
  }
}
</script>
