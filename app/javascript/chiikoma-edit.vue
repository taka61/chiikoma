<template>
  <div class="chiikoma-edit">
    <form>
      <div class="chiikoma-title">
        <lable>困りごと</lable>
        <input type="text" v-model="chiikomaTitle" id="title">
      </div>

      <div class="chiikoma-level">
        <lable>困り度</lable>

        <label>
        <input type="radio" v-bind:value="3" v-model="chiikomaLevel">
        少し</label>

        <label>
        <input type="radio" v-bind:value="5" v-model="chiikomaLevel">
        まあまあ</label>

        <label>
        <input type="radio" v-bind:value="7" v-model="chiikomaLevel">
        かなり</label>

        <label>
        <input type="radio" v-bind:value="10" v-model="chiikomaLevel">
        もうムリ</label>
      </div>

      <div class="chiikoma-frequency">
        <lable>経験する頻度</lable>

        <label>
        <input type="radio" v-bind:value="3" v-model="chiikomaFrequency">
        時々</label>

        <label>
        <input type="radio" v-bind:value="5" v-model="chiikomaFrequency">
        しばしば</label>

        <label>
        <input type="radio" v-bind:value="7" v-model="chiikomaFrequency">
        頻繁</label>

        <label>
        <input type="radio" v-bind:value="10" v-model="chiikomaFrequency">
        常に</label>
      </div>

       <div class="chiikoma-cost">
        <lable>対策コスト</lable>

        <label>
        <input type="radio" v-bind:value="3" v-model="chiikomaCost">
        すぐ</label>

        <label>
        <input type="radio" v-bind:value="5" v-model="chiikomaCost">
        まあまあ時間がかかる</label>

        <label>
        <input type="radio" v-bind:value="8" v-model="chiikomaCost">
        時間がかかる</label>
      </div>

      <button
          class="chiikoma-new-add-button"
          type="button"
          @click="updateChiikoma"
      >
        更新する
      </button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      chiikoma: [],
      chiikomaTitle: '',
      chiikomaLevel: '',
      chiikomaFrequency: '',
      chiikomaCost: '',
      level_of_problem: ''
    }
  },
  computed: {},
  mounted () {
    this.getChiikoma()
  },
  methods: {
    getChiikoma () {
      const url = location.pathname.split('/')
      const path = url[url.length - 2]
      axios.get(`http://127.0.0.1:3000/api/chiikomas/${path}.json`)
      .then((response) => {
        this.chiikomaTitle = response.data.title
        this.chiikomaLevel = response.data.level_of_problem
        this.chiikomaFrequency = response.data.frequency_of_experience
        this.chiikomaCost = response.data.cost_of_solution
      }), (error) => {
          console.log(error, response)
        }
    },
    updateChiikoma() {
      const chiikomaUrl = location.pathname.split('/')
      const chiikomaID = chiikomaUrl[chiikomaUrl.length - 2]
      const requestPath = '/api/chiikomas/' + chiikomaID
      axios.patch(requestPath, {
        title: this.chiikomaTitle,
        level_of_problem: this.chiikomaLevel,
        frequency_of_experience: this.chiikomaFrequency,
        cost_of_solution: this.chiikomaCost,
        total_points: this.chiikomaLevel + this.chiikomaFrequency + this.chiikomaCost
      }).then(response => (
        window.location.href ='/chiikomas'
      ))
    }
  }
}

</script>
