<template>
  <div class="chiikoma-container">
    <table class="table table-hover">
      <tbody>
        <tr>
            <th>困りごと</th>
            <td> {{ chiikomaTitle }}</td>
        </tr>
         <tr>
            <th>困り度</th>
            <td> {{ chiikomaLevel }}</td>
        </tr>
        <tr>
            <th>経験する頻度</th>
            <td> {{ chiikomaFrequency }}</td>
        </tr>
        <tr>
            <th>対策コスト</th>
            <td> {{ chiikomaCost }}</td>
        </tr>
        <tr>
            <th>作成日</th>
            <td> {{ chiikomaCreatedDate }}</td>
        </tr>
        <tr>
            <th>トータルポイント</th>
            <td> {{ chiikomaTotalPoints }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      chiikoma: [],
      chiikomaTitle: '',
      chiikomaLevel:'',
      chiikomaFrequency: '',
      chiikomaCost: '',
      chiikomaCreatedDate: '',
      chiikomaTotalPoints: ''
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
    }
  }
}
</script>
