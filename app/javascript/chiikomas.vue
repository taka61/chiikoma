<template>
  <div class="page">
    <div v-if="chiikomas.length === 0" class="chiikomas-empty is-centered">
      <i class="far fa-grin-wink fa-4x"></i>
      <div class="empty-sentence is-centered"> ちいこまを登録しよう！</div>
      <p>[＋]ボタンでちいこまを登録できます</p>
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
      chiikomas: []
    }
  },
  mounted () {
    this.getChiikoma();
  },
  methods: {
    getChiikoma () {
      axios.get('/api/chiikomas')
      .then(response => (
        this.chiikomas = response.data
      ))
    },
    newChiikoma() {
      window.location.href = '/chiikomas/new'
    }
  }
}
</script>
