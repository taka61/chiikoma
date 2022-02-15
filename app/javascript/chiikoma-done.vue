<template>
  <div class="page">
    <div v-if="chiikomas.length === 0" class="chiikomas-empty is-centered">
      <i class="far fa-tired fa-4x"></i>
      <div class="empty-sentence is-centered"> ちいこまを解決してあげよう！</div>
    </div>
    <div class="card-section">
      <div v-for="chiikoma in chiikomas" :key="chiikoma.id">
        <div class="card-body">
          <span class="icon">
            <i class="fas fa-duotone fa-heart"></i>
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
    this.setChiikoma();
  },
  methods: {
    setChiikoma () {
      axios.get('/api/chiikomas/done')
      .then(response => (
        this.chiikomas = response.data
      ))
    }
  }
}
</script>
