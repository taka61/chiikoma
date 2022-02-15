<template>
  <div class="page">
    <div class="form-section">
      <div class="field">
        <div class="control">
          <lable class="form-label">あなたのためだけの困りごとは？</lable>
          <input class="input" type="text" placeholder="メガネが汚い" v-model="chiikomaTitle" id="title">
          <p class="help is-danger">{{ chiikomasTitleNullError }}</p>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">困り度</lable>
        <p class="help is-danger">{{ chiikomaslProblemLevelNullError }}</p>
        <div class="control">
          <label class="radio-label" for="少し">
            <input type="radio" v-bind:value="3" v-model="chiikomaLevel" id="少し">
            少し
          </label>
          <label class="radio-label" for="まあまあ">
            <input type="radio" v-bind:value="5" v-model="chiikomaLevel" id="まあまあ">
             まあまあ
          </label>
          <label class="radio-label" for="かなり">
            <input type="radio" v-bind:value="7" v-model="chiikomaLevel" id="かなり">
            かなり
          </label>
          <label class="radio-label" for="もうムリ">
            <input type="radio" v-bind:value="10" v-model="chiikomaLevel" id="もうムリ">
            もうムリ
          </label>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">経験する頻度</lable>
        <p class="help is-danger">{{ chiikomasFrequencyNullError }}</p>
        <div class="control">
          <label class="radio-label" for="時々">
            <input type="radio" v-bind:value="3" v-model="chiikomaFrequency" id="時々">
            時々
          </label>
          <label class="radio-label" for="しばしば">
            <input type="radio" v-bind:value="5" v-model="chiikomaFrequency" id="しばしば">
            しばしば
          </label>
           <label class="radio-label" for="頻繁">
            <input type="radio" v-bind:value="7" v-model="chiikomaFrequency" id="頻繁">
            頻繁
          </label>
          <label class="radio-label" for="常に">
            <input type="radio" v-bind:value="10" v-model="chiikomaFrequency" id="常に">
            常に
          </label>
        </div>
      </div>

      <div class="field">
        <lable class="form-label">対策コスト</lable>
        <p class="help is-danger">{{ chiikomasCostNullError }}</p>
        <div class="control">
          <label class="radio-label" for="すぐ">
            <input type="radio" v-bind:value="3" v-model="chiikomaCost" id="すぐ">
            すぐ
          </label>
          <label class="radio-label" for="少し時間がかかる">
            <input type="radio" v-bind:value="5" v-model="chiikomaCost" id="少し時間がかかる">
            少し時間がかかる
          </label>
          <label class="radio-label" for="時間がかかる">
            <input type="radio" v-bind:value="8" v-model="chiikomaCost" id="時間がかかる">
            時間がかかる
          </label>
        </div>
      </div>

      <div class="field-button">
        <div class="control">
          <button
            class="'button is-fullwidth button is-danger is-outlined'"
            type="button"
            @click="updateChiikoma">
            更新する
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
      axios.get(`/api/chiikomas/${path}.json`)
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
        chiikomaCost: this.chiikomaCost,
        total_points: this.chiikomaLevel + this.chiikomaFrequency + this.chiikomaCost
      }).then(response => (
        window.location.href ='/chiikomas'
      ))
    }
  }
}
</script>
