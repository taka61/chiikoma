<template>
  <div class="chiikoma-new">
    <form>
      <div class="chiikoma-title">
        <lable>困りごと</lable>
        <input type="text" required placeholder="メガネが汚い" v-model="title">
      </div>

      <div class="chiikoma-level">
        <lable>困り度</lable>

        <label>
        <input type="radio" v-bind:value="3" v-model="level_of_problem">
        少し</label>

        <label>
        <input type="radio" v-bind:value="5" v-model="level_of_problem">
        まあまあ</label>

        <label>
        <input type="radio" v-bind:value="7" v-model="level_of_problem">
        かなり</label>

        <label>
        <input type="radio" v-bind:value="10" v-model="level_of_problem">
        もうムリ</label>
      </div>

      <div class="chiikoma-frequency">
        <lable>経験する頻度</lable>

        <label>
        <input type="radio" v-bind:value="3" v-model="frequency_of_experience">
        時々</label>

        <label>
        <input type="radio" v-bind:value="5" v-model="frequency_of_experience">
        しばしば</label>

        <label>
        <input type="radio" v-bind:value="7" v-model="frequency_of_experience">
        頻繁</label>

        <label>
        <input type="radio" v-bind:value="10" v-model="frequency_of_experience">
        常に</label>
      </div>

       <div class="chiikoma-cost">
        <lable>対策コスト</lable>

        <label>
        <input type="radio" v-bind:value="3" v-model="cost_of_solution">
        すぐ</label>

        <label>
        <input type="radio" v-bind:value="5" v-model="cost_of_solution">
        少し時間がかかる</label>

        <label>
        <input type="radio" v-bind:value="8" v-model="cost_of_solution">
        時間がかかる</label>
      </div>

      <button
          class="chiikoma-new-add-button"
          type="button"
          @click="createChiikoma"
      >
        登録する
      </button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      title: '',
      level_of_problem:'',
      frequency_of_experience:'',
      cost_of_solution:''
    }
  },
  methods: {
    createChiikoma() {
      axios.post('/api/chiikomas', {
          title: this.title,
          level_of_problem: this.level_of_problem,
          frequency_of_experience: this.frequency_of_experience,
          cost_of_solution: this.cost_of_solution
      }).then(response => (
        window.location.href ='/chiikomas'
      ))
    }
  }
}
</script>
