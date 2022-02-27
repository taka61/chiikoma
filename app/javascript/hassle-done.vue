<template>
  <div class="page">
    <div v-if="hassles.length === 0" class="hassles-empty is-centered">
      <i class="far fa-tired fa-4x"></i>
      <div class="empty-sentence is-centered"> ちいこまを解決してあげよう！</div>
    </div>
    <div class="card-section">
      <div v-for="hassle in hassles" :key="hassle.id">
        <div class="card-body">
          <span class="icon">
            <i class="fas fa-duotone fa-heart"></i>
          </span>
          <div class="card-title">
            <a :href='`/hassles/${hassle.id}`'> {{ hassle.title }}</a>
          </div>
          <div class="card-point">
             {{ hassle.total_points }}
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
      hassles: []
    }
  },
  mounted () {
    this.setHassle();
  },
  methods: {
    setHassle () {
      axios.get('/api/hassles/done')
      .then(response => (
        this.hassles = response.data
      ))
    }
  }
}
</script>
