<template>
  <div id="hassle-index" class="page">
    <div class="tab-items">
      <div class="field has-addons">
        <p class="control">
          <button
            :class="{'active': isActive === '1'}"
            class="button care-button"
            type="button"
            @click="getNotSolved">
            ケアしたい
          </button>
        </p>
        <p class="control">
          <button
            :class="{'active': isActive === '2'}"
            class="button solved-button"
            type="button"
             @click="getSolved">
             解決済
          </button>
        </p>
      </div>
    </div>

    <div v-if="notSolvedHassles.length === 0 && isActive === '1'" class="chiikomas-empty is-centered">
      <i class="far fa-grin-wink fa-4x"></i>
      <div class="empty-sentence is-centered"> ちいこまを登録しよう！</div>
      <p>[＋]ボタンでちいこまを登録できます</p>
    </div>
    
    <modal name="daily-chiikoma" width="70%" height="340px" :max-width="630" :adaptive="true">
      <div class="daily-modal-body">
        <h1 class="today-chiikoma is-centered">
          今日のちいこま
        </h1>
        <div class="modal-message-section">
          <h1 class="message-title is-centered">
              {{ title }}
          </h1>
          <div class="caution-message">
            <p>「追加する」を選択すると、「困り度」・「経験する」・「対策コスト」は中度で登録されます。変更したい場合は追加後、一覧ページよりちいこまを編集して下さい。</p> 
          </div>
        </div>
      </div>
      <div class="modal-button-wrapper">
        <div class="control">
          <button
            class="button add-button"
            type="button"
            @click="addHassle">
            追加する
          </button>
          <button
            class="button close-button"
            type="button"
            @click="closeHassle">
            閉じる
          </button>
        </div>
      </div>
    </modal>
    
    <div class="card-section">
      <div v-if="isActive === '1'">
        <div v-for="hassle in notSolvedHassles" :key="hassle.id">
          <div class="card-body">
            <div class="card-title">
              <a :href='`/hassles/${hassle.id}`' class="card-detail"> {{ hassle.title }}</a>
            </div>
            <div class="card-point">
               {{ hassle.total_points }}
            </div>
          </div>
        </div>
      </div>

      <div v-else-if="isActive === '2'">
        <div v-for="hassle in solvedHassles" :key="hassle.id">
          <div class="card-body2">
            <span class="icon">
              <i class="fas fa-duotone fa-heart"></i>
            </span>
            <div class="card-title2">
              <a :href='`/hassles/${hassle.id}`' class="card-detail2"> {{ hassle.title }}</a>
            </div>
            <div class="card-point2">
               {{ hassle.total_points }}
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="new-chiikoma-button-section">
      <div class="field-button">
        <div class="control">
          <button
            class="button new-chiikoma-button"
            type="button"
            @click="newHassle">
            <i class="fa-solid fa-plus"></i>
            <span class="button-text">ちいこまを追加</span>
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
      isActive: '1',
      hassles: [],
      difficulty_levels:'',
      frequency:'',
      cost:'',
      is_made_by_admin: '',
      title:''
    }
  },
  mounted () {
    this.getCookie (); 
    this.getHassle();
    this.randomHassle ();
  },
  computed: {
    solvedHassles() {
      return this.hassles.filter((hassle) => hassle.solved)
    },
    notSolvedHassles() {
      return this.hassles.filter((hassle) => !hassle.solved)
    }
  },
  methods: {
    randomHassle () {
      const titles = ['衣替えを行いたい','キッチンの換気扇が汚れている','トイレの匂いが気になる','睡眠中に足がつりやすい',
                   'パソコンのディスプレイの汚れが気になる','洗濯機のフィルターごみが溜まっている','網戸の締まりが悪い',
                   '睡眠中に足がつりやすい', '自転車の鍵を探すのが毎回手間（ナンバーロック式などに替える?）',
                   '網戸の締まりが悪い','洗面台の鏡のウロコを取りたい','エアコンのクリーニング','スマホの電池の減りが気になる',
                   '眼精疲労','肩がずっと凝っている','自転車のタイヤの空気が抜けてきた','電球の交換', '不用品を処分したい'
                    ]
      this.title = titles[Math.floor(Math.random() * titles.length)]
    },
    getHassle () {
      axios.get('/api/hassles')
      .then(response => (
        this.hassles = response.data
      ))
    },
    newHassle() {
      window.location.href = '/hassles/new'
    },
    addHassle() {
      this.setCookie()
      axios.post('/api/hassles', {
        title: this.title,
        difficulty_levels: 5,
        frequency: 5,
        cost: 5,
        total_points:15,
        is_made_by_admin: true
      }).then(response => (
        window.location.href ='/hassles'
      ))
    },
    closeHassle() {
      this.setCookie ()
      this.$modal.close('modal-thanks');
    },
    getNotSolved() {
      this.isActive = '1'
    },
    getSolved(){
      this.isActive = '2'
    },
    getCookie () {
      if(this.$cookies.get("CookieRecieve") == "on") {
        this.$modal.hide('daily-chiikoma')
      } else {
        this.$modal.show('daily-chiikoma')
      }
    },
    setCookie (){
      this.$cookies.set("CookieRecieve", "on", "86400s")
      location.reload();
    }
  }
}
</script>
