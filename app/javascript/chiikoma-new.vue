<template>
  <div class="page">
    <div class="form-section">
      <div class="field">
        <div class="control">
          <lable class="form-label">あなたのためだけの困りごとは？</lable>
          <input class="input" type="text"  placeholder="メガネの汚れが気になる" v-model="title" id="title">
          <p class="help is-danger">{{ chiikomasTitleNullError }}</p>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">困り度</lable>
        <p class="help is-danger">{{ chiikomaslProblemLevelNullError }}</p>
        <div class="control">
          <label class="radio-label" for="少し">
            <input type="radio" v-bind:value="3" v-model="level_of_problem" id="少し">
            少し
          </label>
          <label class="radio-label" for="まあまあ">
            <input type="radio" v-bind:value="5" v-model="level_of_problem" id="まあまあ">
             まあまあ
          </label>
          <label class="radio-label" for="かなり">
            <input type="radio" v-bind:value="7" v-model="level_of_problem" id="かなり">
            かなり
          </label>
          <label class="radio-label" for="もうムリ">
            <input type="radio" v-bind:value="10" v-model="level_of_problem" id="もうムリ">
            もうムリ
          </label>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">経験する頻度</lable>
        <p class="help is-danger">{{ chiikomasFrequencyNullError }}</p>
        <div class="control">
          <label class="radio-label" for="時々">
            <input type="radio" v-bind:value="3" v-model="frequency_of_experience" id="時々">
            時々
          </label>
          <label class="radio-label" for="しばしば">
            <input type="radio" v-bind:value="5" v-model="frequency_of_experience" id="しばしば">
            しばしば
          </label>
           <label class="radio-label" for="頻繁">
            <input type="radio" v-bind:value="7" v-model="frequency_of_experience" id="頻繁">
            頻繁
          </label>
          <label class="radio-label" for="常に">
            <input type="radio" v-bind:value="10" v-model="frequency_of_experience" id="常に">
            常に
          </label>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">対策コスト</lable>
        <p class="help is-danger">{{ chiikomasCostNullError }}</p>
        <div class="control">
          <label class="radio-label" for="すぐ">
            <input type="radio" v-bind:value="3" v-model="cost_of_solution" id="すぐ">
            すぐ
          </label>
          <label class="radio-label" for="少し時間がかかる">
            <input type="radio" v-bind:value="5" v-model="cost_of_solution" id="少し時間がかかる">
            少し時間がかかる
          </label>
          <label class="radio-label" for="時間がかかる">
            <input type="radio" v-bind:value="8" v-model="cost_of_solution" id="時間がかかる">
            時間がかかる
          </label>
        </div>
      </div>

      <div class="field-button">
        <div class="control">
          <button
            class="'button is-fullwidth button is-danger is-outlined'"
            type="button"
            @click="createChiikoma">
            登録する
          </button>
       </div>
      </div>
    </div>
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
      cost_of_solution:'',
      total_points:'',
      registration_points:'',
      chiikomasTitleNullError: '',
      chiikomaslProblemLevelNullError: '',
      chiikomasFrequencyNullError :'',
      chiikomasCostNullError:''
    }
  },
  methods: {
    checkForm() {
      if(this.title === '') {
        this.chiikomasTitleNullError = '※困りごとを入力してください'
        return true
      } else {
        this.chiikomasTitleNullError = ''
      }
      if(this.level_of_problem === '') {
        this.chiikomaslProblemLevelNullError = '※困り度を入力してください'
        return true
      } else {
        this.chiikomaslProblemLevelNullError = ''
      }
      if(this.frequency_of_experience === '') {
        this.chiikomasFrequencyNullError = '※経験する頻度を入力してください'
        return true
      } else {
        this.chiikomasFrequencyNullError = ''
      }
      if(this.cost_of_solution === '') {
        this.chiikomasCostNullError = '※経験する頻度を入力してください'
        return true
      } else {
        this.chiikomasCostNullError = ''
      }
    },
    cal_total_points() {
      this.total_points = this.level_of_problem + this.frequency_of_experience + this.cost_of_solution
    },
    createChiikoma() {
      if(this.checkForm()) {
        return
      }
      this.cal_total_points()
      axios.post('/api/chiikomas', {
          title: this.title,
          level_of_problem: this.level_of_problem,
          frequency_of_experience: this.frequency_of_experience,
          cost_of_solution: this.cost_of_solution,
          total_points: this.total_points,
          registration_points: 5
      }).then(response => (
        window.location.href ='/chiikomas'
      ))
    }
  }
}
</script>
