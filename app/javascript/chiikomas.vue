<template>
  <div class="page">
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
      axios.get('/api/chiikomas')
      .then(response => (
        this.chiikomas = response.data
      ))
    }
  }
}
</script>
