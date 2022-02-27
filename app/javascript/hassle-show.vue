<template>
  <div class="page">
    <div class="primary-section">
        <div class="primary-item">
          <div class="primary-text">
            {{ hassleTitle }}
          </div>
        </div>
    </div>

    <modal name="modal-thanks" width="80%" height="80%">
      <div class="modal-body is-centered">
        <i class="far fa-kiss-wink-heart fa-6x"></i>
        <h1 class="is-centered">
          ケアしてくれてありがとう!!
        </h1>
        <div class="message-section">
          <div class="message-body is-centered">
            今日も1日おつかれさま🌈
          </div>
        </div>
        <div class="field-button">
          <div class="control">
            <button
              class="button"
              type="button"
              @click="donehassle">
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
        {{ hassleLevel }}
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        経験する頻度
      </div>
      <div class="list-item">
        {{ hassleFrequency }}
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        対策コスト
      </div>
      <div class="list-item">
        {{ hassleCost }}
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        トータルポイント
      </div>
      <div class="list-item">
        {{ hassleTotalPoints }}
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        作成日
      </div>
      <div class="list-date-item">
        {{ hassleCreatedDate | moment }}
      </div>
    </div>

    <div v-if="!hassle.done" class="field-button">
      <div class="control">
        <button
          class="button"
          type="button"
          @click="openModal">
          ケアした
        </button>
        <button
          class="button-edit"
          type="button"
          @click="editHassle">
          編集
        </button>
        <button
          class="button-delete"
          type="button"
          @click="deleteHassle">
          削除
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
      hassle: [],
      hassleTitle: '',
      hassleLevel:'',
      hassleFrequency: '',
      hassleCost: '',
      hassleCreatedDate: '',
      hassleTotalPoints: '',
    }
  },
  computed: {},
  mounted () {
    this.getHassle()
  },
  methods: {
    getHassle () {
      const url = location.pathname.split('/')
      const path = url[url.length - 1]
      axios.get(`/api/hassles/${path}.json`)
      .then((response) => {
        this.hassle = response.data
        this.hassleTitle = response.data.title
        this.hassleLevel = response.data.level_of_problem
        this.hassleFrequency = response.data.frequency_of_experience
        this.hassleCost = response.data.cost_of_solution
        this.hassleCreatedDate = response.data.created_at
        this.hassleTotalPoints = response.data.total_points
      }, (error) => {
          console.log(error, response)
        })
    },
    openModal() {
      this.$modal.show('modal-thanks');
    },
    doneHassle() {
      const hassleUrl = location.pathname.split('/')
      const hassleID = hassleUrl[hassleUrl.length - 1]
      const requestPath = '/api/hassles/' + hassleID
      const today = new Date();
      axios.patch(requestPath , {
        done: true,
        solved_on: today
      }).then(response => (
        window.location.href ='/hassles/done'
      ))
    },
    editHassle() {
      const hassleUrl = location.pathname.split('/')
      const hassleID = hassleUrl[hassleUrl.length - 1]
      window.location.href =`/hassles/${hassleID}/edit`
    },
    deleteHassle() {
      const hassleUrl = location.pathname.split('/')
      const hassleID = hassleUrl[hassleUrl.length - 1]
      const requestPath = '/api/hassles/' + hassleID
      axios.delete(requestPath, {
    }).then(response => (
        window.location.href ='/hassles'
      ))
    }
  }
}
</script>
