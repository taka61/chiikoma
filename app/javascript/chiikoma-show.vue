<template>
  <div class="page">
    <div class="primary-section">
        <div class="primary-item">
          <div class="primary-text">
            {{ chiikomaTitle }}
          </div>
        </div>
      </div>

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
        {{ chiikomaCreatedDate }}
      </div>
    </div>

    </div>
  </div>
</template>

<script>
import axios from 'axios'
import {format} from 'date-fns'

export default {
  data() {
    return {
      chiikoma: [],
      chiikomaTitle: '',
      chiikomaLevel:'',
      chiikomaFrequency: '',
      chiikomaCost: '',
      chiikomaCreatedDate: '',
      chiikomaTotalPoints: '',
      format,
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
      axios.get(`http://127.0.0.1:3000/api/chiikomas/${path}.json`)
      .then((response) => {
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
    moment(date, format) {
      return moment(date).format(format)
    }
  }
}
</script>
