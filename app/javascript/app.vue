<template>
  <div id="app">
    <div class="flex">
      <div v-for="chiikoma in chiikomas" :key="chiikoma.id" class="card">
        <div class="card-body">
           <div class="card-title">
             <a :href='`/chiikomas/${chiikoma.id}`'> {{ chiikoma.title }}</a>
           </div>
             {{ chiikoma.total_points }}
          </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

export default {
  data: function () {
    return {
      chiikomas: []
    }
  },
  mounted () {
    this.setChiikoma();
  },
  methods: {
    setChiikoma: function() {
      axios.get('/api/chiikomas')
      .then(response => (
        this.chiikomas = response.data
      ))
    }
  }
}
</script>

<style lang="scss" scoped>

  .flex {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }

  .card {
    width: 238px;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
    margin: 16px;
    &-body {
      padding: 1.25rem;
    }
    &-title {
      margin-bottom: .75rem;
      font-weight: 600;
    }
  }

</style>
