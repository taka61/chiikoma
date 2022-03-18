<template>
  <div class="page">
    <div class="form-section">
      <div class="field">
        <div class="control">
          <lable class="form-label">あなたのためだけの困りごとは？</lable>
          <input class="input" type="text" placeholder="メガネが汚い" v-model="hassleTitle" id="title">
          <p class="help is-danger">{{ hasslesTitleNullError }}</p>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">どれくらい困ってる？</lable>
        <div class="control">
          <ul>
            <li class="radio-button"><label class="radio-label" for="少し">
              <input type="radio" v-bind:value="3" v-model="hassleLevel" id="少し">
              少し
            </label></li>
            <li class="radio-button"><label class="radio-label" for="まあまあ">
              <input type="radio" v-bind:value="5" v-model="hassleLevel" id="まあまあ">
               まあまあ
            </label>
            <li class="radio-button"><label class="radio-label" for="かなり">
              <input type="radio" v-bind:value="7" v-model="hassleLevel" id="かなり">
              かなり
            </label></li>
            <li class="radio-button"><label class="radio-label" for="もうムリ">
              <input type="radio" v-bind:value="10" v-model="hassleLevel" id="もうムリ">
              もうムリ
            </label></li>
          </ul>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">どれくらいの頻度？</lable>
        <div class="control">
          <ul>
            <li class="radio-button"><label class="radio-label" for="時々">
              <input type="radio" v-bind:value="3" v-model="hassleFrequency" id="時々">
              時々
            </label></li>
            <li class="radio-button"><label class="radio-label" for="しばしば">
              <input type="radio" v-bind:value="5" v-model="hassleFrequency" id="しばしば">
              しばしば
            </label></li>
             <li class="radio-button"><label class="radio-label" for="頻繁">
              <input type="radio" v-bind:value="7" v-model="hassleFrequency" id="頻繁">
              頻繁
            </label></li>
            <li class="radio-button"><label class="radio-label" for="常に">
              <input type="radio" v-bind:value="10" v-model="hassleFrequency" id="常に">
              常に
            </label></li>
          </ul>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">解決にかかる手間は？</lable>
        <div class="control">
          <ul>
            <li class="radio-button"><label class="radio-label" for="すぐ">
              <input type="radio" v-bind:value="3" v-model="hassleCost" id="すぐ">
              すぐ
            </label></li>
            <li class="radio-button"><label class="radio-label" for="少し時間がかかる">
              <input type="radio" v-bind:value="5" v-model="hassleCost" id="少し時間がかかる">
              少し時間がかかる
            </label></li>
            <li class="radio-button"><label class="radio-label" for="時間がかかる">
              <input type="radio" v-bind:value="8" v-model="hassleCost" id="時間がかかる">
              時間がかかる
            </label></li>
          </ul>
        </div>
      </div>
      
      <div class="control">
        <div class="button_wrapper">
          <button
            class="button update-btn"
            type="button"
            @click="updateHassle">
            更新する
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
      hassle: [],
      hassleTitle: '',
      hassleLevel: '',
      hassleFrequency: '',
      hassleCost: '',
      hassleTotalPoints: '',
      hasslesTitleNullError: '', 
      id:'' 
    }
  },
  mounted () {
    this.getHassle()
  },
  methods: {
    checkForm() {
      if(this.hassleTitle === '') {
        this.hasslesTitleNullError = '※困りごとを入力してください'
        return true
      } else {
        this.hasslesTitleNullError = ''
      }
    },
    getHassle () {
      const url = location.pathname.split('/')
      const path = url[url.length - 2]
      axios.get(`/api/hassles/${path}.json`)
      .then((response) => {
        this.id = response.data.id
        this.hassleTitle = response.data.title
        this.hassleLevel = response.data.difficulty_levels
        this.hassleFrequency = response.data.frequency
        this.hassleCost = response.data.cost
      }), (error) => {
          console.log(error, response)
        }
    },
    cal_total_points() {
      this.hassleTotalPoints = this.hassleLevel + this.hassleFrequency + this.hassleCost
    },
    updateHassle() {
      if(this.checkForm()) {
        return
      }
      this.cal_total_points()
      axios.patch(`/api/hassles/${this.id}`, {
        title: this.hassleTitle,
        difficulty_levels: this.hassleLevel,
        frequency: this.hassleFrequency,
        cost: this.hassleCost,
        total_points: this.hassleTotalPoints
      }).then(response => (
        window.location.href ='/hassles'
      ))
    }
  }
}
</script>
