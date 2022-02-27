<template>
  <div class="page">
    <div v-if="hassles.length === 0" class="hassles-empty is-centered">
      <i class="far fa-grin-wink fa-4x"></i>
      <div class="empty-sentence is-centered"> ちいこまを登録しよう！</div>
      <p>[＋]ボタンでちいこまを登録できます</p>
    </div>

    <div id="js_modal" class="modal">
      <div class="modal_wrap">
        <div class="modal_inner">
          <h1 class="is-centered has-text-weight-bold">
            今日のちいこま
          </h1>
          <div class="message-section">
            <div class="message-body is-centered">
                {{ title }}
            </div>
          </div>
          <div class="caution-message is-centered">
            <p>  ※『追加する』を選択すると、「困り度」・「経験する」・「対策コスト」は中度で登録されます。</p> 
            <p>  変更したい場合は追加後、一覧ページよりちいこまを編集して下さい。</p> 
          </div>
          <div class="field-button">
            <div class="control">
              <button
                class="button"
                type="button"
                @click="addHassle">
                追加する
              </button>
              <button
                class="button-delete js_modal_close modal_close"
                type="button">
                閉じる
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="card-section">
      <div v-for="hassle in hassles" :key="hassle.id">
        <div class="card-body">
          <span class="icon">
            <i class="fa-solid fa-heart-crack"></i>
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

    <div class="new-hassle-button-section">
      <div class="field-button">
        <div class="control">
          <button
            class="button button-add"
            type="button"
            @click="newHassle">
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
      hassles: [],
      difficulty_levels:'',
      frequency:'',
      cost:'',
      is_made_by_admin: '',
      title:''
    }
  },
  mounted () {
    this.gethassle();
    this.randomhassle ();
  },
  methods: {
    randomhassle () {
      const titles = ['衣替えを行いたい','キッチンの換気扇が汚れている','トイレの匂いが気になる','睡眠中に足がつりやすい',
                   'パソコンのディスプレイの汚れが気になる','洗濯機のフィルターごみが溜まっている','網戸の締まりが悪い',
                   '睡眠中に足がつりやすい', '自転車の鍵を探すのが毎回面倒（ナンバーロック式などの鍵に替える?）',
                   '網戸の締まりが悪い','洗面台の鏡のウロコを取りたい','エアコンのクリーニング','スマホの電池の減りが気になる',
                   '眼精疲労','肩がずっと凝っている','自転車のタイヤの空気が抜けてきた','電球の交換', '不用品を処分したい'
                    ]
      this.title = titles[Math.floor(Math.random() * titles.length)]
    },
    gethassle () {
      axios.get('/api/hassles')
      .then(response => (
        this.hassles = response.data
      ))
    },
    newHassle() {
      window.location.href = '/hassles/new'
    },
    addHassle() {
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
    }
  }
}
</script>
