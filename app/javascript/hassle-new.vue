<template>
  <div class="page">
    <div class="form-section">
      <div class="field">
        <div class="control">
          <lable class="form-label">あなたのためだけの困りごとは？</lable>
          <input class="input" type="text"  placeholder="メガネの汚れが気になる" v-model="title" id="title">
          <p class="help is-danger">{{ hasslesTitleNullError }}</p>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">どれくらい困ってる？</lable>
        <p class="help is-danger">{{ hassleslProblemLevelNullError }}</p>
        <div class="control">
          <ul class="radio-buttons has-4items">
            <li class="radio-button"><label class="radio-label" for="少し">
              <input type="radio" v-bind:value="3" v-model="difficulty_levels" id="少し">
              少し
            </label></li>
            <li class="radio-button"><label class="radio-label" for="まあまあ">
              <input type="radio" v-bind:value="5" v-model="difficulty_levels" id="まあまあ">
               まあまあ
            </label></li>
            <li class="radio-button"><label class="radio-label" for="かなり">
              <input type="radio" v-bind:value="7" v-model="difficulty_levels" id="かなり">
              かなり
            </label></li>
            <li class="radio-button"><label class="radio-label" for="もうムリ">
              <input type="radio" v-bind:value="10" v-model="difficulty_levels" id="もうムリ">
              もうムリ
            </label></li>
          </ul>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">どれくらいの頻度？</lable>
        <p class="help is-danger">{{ hasslesFrequencyNullError }}</p>
        <div class="control">
          <ul class="radio-buttons has-4items">
            <li class="radio-button"><label class="radio-label" for="時々">
              <input type="radio" v-bind:value="3" v-model="frequency" id="時々">
              時々
            </label></li>
            <li class="radio-button"><label class="radio-label" for="しばしば">
              <input type="radio" v-bind:value="5" v-model="frequency" id="しばしば">
              しばしば
            </label>
             <li class="radio-button"><label class="radio-label" for="頻繁">
              <input type="radio" v-bind:value="7" v-model="frequency" id="頻繁">
              頻繁
            </label></li>
            <li class="radio-button"><label class="radio-label" for="常に">
              <input type="radio" v-bind:value="10" v-model="frequency" id="常に">
              常に
            </label></li>
          </ul>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">解決にかかる手間は？</lable>
        <p class="help is-danger">{{ hasslesCostNullError }}</p>
        <div class="control">
          <ul class="radio-buttons has-3items">
            <li class="radio-button"><label class="radio-label" for="すぐ">
              <input type="radio" v-bind:value="3" v-model="cost" id="すぐ">
              すぐ
            </label></li>
            <li class="radio-button"><label class="radio-label" for="少し時間がかかる">
              <input type="radio" v-bind:value="5" v-model="cost" id="少し時間がかかる">
              少し時間がかかる
            </label></li>
            <li class="radio-button"><label class="radio-label" for="時間がかかる">
              <input type="radio" v-bind:value="8" v-model="cost" id="時間がかかる">
              時間がかかる
            </label></li>
          </ul>
        </div>
      </div>

      <div class="control">
        <div class="button_wrapper">
          <button
            class="button registration-btn"
            type="button"
            @click="createHassle">
            登録する
          </button>
        </div>
      </div>
      <div class="link-items__item">
        <div class="link-item">
          <a href="/hassles">キャンセル</a>
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
      difficulty_levels:'',
      frequency:'',
      cost:'',
      total_points:'',
      registration_points:'',
      is_made_by_admin:'',
      hasslesTitleNullError: '',
      hassleslProblemLevelNullError: '',
      hasslesFrequencyNullError :'',
      hasslesCostNullError:''
    }
  },
  methods: {
    checkForm() {
      if(this.title === '') {
        this.hasslesTitleNullError = '※困りごとを入力してください'
        return true
      } else {
        this.hasslesTitleNullError = ''
      }
      if(this.difficulty_levels === '') {
        this.hassleslProblemLevelNullError = '※困り度を入力してください'
        return true
      } else {
        this.hassleslProblemLevelNullError = ''
      }
      if(this.frequency === '') {
        this.hasslesFrequencyNullError = '※経験する頻度を入力してください'
        return true
      } else {
        this.hasslesFrequencyNullError = ''
      }
      if(this.cost === '') {
        this.hasslesCostNullError = '※経験する頻度を入力してください'
        return true
      } else {
        this.hasslesCostNullError = ''
      }
    },
    cal_total_points() {
      this.total_points = this.difficulty_levels + this.frequency + this.cost
    },
    createHassle() {
      if(this.checkForm()) {
        return
      }
      this.cal_total_points()
      axios.post('/api/hassles', {
          title: this.title,
          difficulty_levels: this.difficulty_levels,
          frequency: this.frequency,
          cost: this.cost,
          total_points: this.total_points,
          is_made_by_admin: false,
          registration_points: 5
      }).then(response => (
        window.location.href ='/hassles'
      ))
    }
  }
}
</script>
