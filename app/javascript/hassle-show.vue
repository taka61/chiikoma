<template>
  <div class="page">
    <div class="primary-section">
      <div class="primary-item">
        <div class="primary-text">
          {{ hassleTitle }}
        </div>
      </div>
    </div>

    <modal name="modal-thanks" width="70%" height="400px" :max-width="630" :adaptive="true">
      <div class="modal-body is-centered">
      <i class="far fa-kiss-wink-heart fa-6x"></i>
      <h1 class="modal-title is-centered">
        ケアしてくれてありがとう!!
      </h1>
      <div class="message-section">
      <h1 class="message-title is-centered">
        今日も1日おつかれさま🌈
      </h1>
      </div>
      <div class="button-wrapper">
        <div class="control">
          <button
            class="button done-button"
            type="button"
            @click="doneHassle">
            次へ
          </button>
        </div>
      </div>
      </div>
    </modal>

    <div class="top-list-section">
      <div class="list-text">
        困り度
      </div>
      <div class="list-item">
        <div class="list-point">
          {{ hassleLevel }}
        </div>
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        経験する頻度
      </div>
      <div class="list-item">
        <div class="list-point">
          {{ hassleFrequency }}
        </div>
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        対策コスト
      </div>
      <div class="list-item">
        <div class="list-point">
          {{ hassleCost }}
        </div>
      </div>
    </div>

    <div class="list-section">
      <div class="list-text">
        トータルポイント
      </div>
      <div class="list-item">
        <div class="list-point">
          {{ hassleTotalPoints }}
        </div>
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

    <div class="control">
      <div v-if="!hassle.solved" class="three-buttons-container">
        <button
          class="button finished-button"
          type="button"
          @click="openModal">
          ケアした
        </button>
        <button
          class="button edit-button"
          type="button"
          @click="editHassle">
          編集
        </button>
        <button
          class="button delete-button"
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
      id: ''
    }
  },
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
        this.id = response.data.id
        this.hassleTitle = response.data.title
        this.hassleLevel = response.data.difficulty_levels
        this.hassleFrequency = response.data.frequency
        this.hassleCost = response.data.cost
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
      const today = new Date();
      axios.patch(`/api/hassles/${this.id}` , {
        solved: true,
        solved_on: today
      }).then(response => (
        window.location.href ='/hassles'
      ))
    },
    editHassle() {
      window.location.href =`/hassles/${this.id}/edit`
    },
    deleteHassle() {
      axios.delete(`/api/hassles/${this.id}`, {
    }).then(response => (
        window.location.href ='/hassles'
      ))
    }
  }
}
</script>
