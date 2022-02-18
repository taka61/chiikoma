<template>
  <div class="page">
    <div v-if="chiikomas.length === 0" class="chiikomas-empty is-centered">
      <i class="far fa-grin-wink fa-4x"></i>
      <div class="empty-sentence is-centered"> ちいこまを登録しよう！</div>
      <p>[＋]ボタンでちいこまを登録できます</p>
    </div>

    <div id="js_modal" class="modal">
      <div class="modal_wrap">
        <div class="modal_inner">
          <h1 class="is-centered">
            今日のちいこま
          </h1>
          <div class="message-section">
            <div class="message-body is-centered">
                {{ title }}
            </div>
          </div>
          <div class="field-button">
            <div class="control">
              <button
                class="button"
                type="button"
                @click="addChiikoma">
                追加する
              </button>
              <button
                class="button js_modal_close modal_close"
                type="button">
                閉じる
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="card-section">
      <div v-for="chiikoma in chiikomas" :key="chiikoma.id">
        <div class="card-body">
          <span class="icon">
            <i class="fa-solid fa-heart-crack"></i>
          </span>
          <div class="card-title">
            <a :href='`/chiikomas/${chiikoma.id}`'> {{ chiikoma.title }}</a>
          </div>
          <div class="card-point">
             {{ chiikoma.total_points }}
          </div>
        </div>
      </div>
    </div>

    <div class="new-chiikoma-button-section">
      <div class="field-button">
        <div class="control">
          <button
            class="button button-add"
            type="button"
            @click="newChiikoma">
            <i class="fa-solid fa-plus"></i>
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
      chiikomas: [],
      level_of_problem:'',
      frequency_of_experience:'',
      cost_of_solution:'',
      is_made_by_admin: '',
      title:'',
      titles: ['衣替えを行う','キッチンの換気扇を掃除する','保険料の見直し',
               'パソコンの掃除']
    }
  },
  mounted () {
    this.getChiikoma();
    this.random();
  },
  methods: {
    random () {
     this.title = this.titles[Math.floor(Math.random() * this.titles.length)]
    },
    getChiikoma () {
      axios.get('/api/chiikomas')
      .then(response => (
        this.chiikomas = response.data
      ))
    },
    newChiikoma() {
      window.location.href = '/chiikomas/new'
    },
    addChiikoma() {
      axios.post('/api/chiikomas', {
          title: this.title,
          level_of_problem: 5,
          frequency_of_experience: 5,
          cost_of_solution: 5,
          is_made_by_admin: true
      }).then(response => (
        window.location.href ='/chiikomas'
      ))
    }
  }
}
</script>
