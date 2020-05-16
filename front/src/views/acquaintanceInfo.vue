<template>
  <div class="acquaintanceInfo">
    <div class="basicData">
      <h1>基本データ</h1>
      <el-row :gutter="20">
        <el-col :span="9"><div class="grid-content bg-purple">名前：</div></el-col>
        <el-col :span="9"><div class="grid-content bg-purple">{{info.name}}</div></el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="9"><div class="grid-content bg-purple">あだ名：</div></el-col>
        <el-col :span="9"><div class="grid-content bg-purple">{{info.nickname}}</div></el-col>
      </el-row>
    </div>
    <div>
      <el-button type="primary" @click="dialogVisible = true" round>Storyを追加する</el-button>
    </div>
    <div class="timeline">
      <el-timeline v-for="item in storise" :key="item.id">
        <el-timeline-item :timestamp="item.date" placement="top">
          <el-card>
            <p>{{ item.content }}</p>
          </el-card>
        </el-timeline-item>
      </el-timeline>
    </div>
    <el-dialog
      title="Storyを追加する"
      :visible.sync="dialogVisible"
      width="30%">
      <div class="block">
        <el-date-picker
          v-model="story.date"
          type="date"
          placeholder="Pick a day">
        </el-date-picker>
      </div>
      <a>内容</a>
      <el-input
        type="textarea"
        :rows="2"
        placeholder="内容"
        v-model="story.content">
      </el-input>
      <el-button type="primary" @click="sendStory" round>Storyを追加する</el-button>
    </el-dialog>
  </div>
</template>

<script>

export default {
  name: 'acquaintanceInfo',
  data () {
    return {
      reverse: true,
      info: this.$store.state.acquser,
      story: {
        date: '',
        content: ''
      },
      dialogVisible: false,
      storise: {}
    }
  },
  mounted () {
    this.axios.get(this.$store.state.apiBaseURL + 'stories/index', {
      params: {
        acquaintancesid: this.info.id
      },
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + this.$store.state.userinfo.token
      }
    })
      .then((response) => {
        this.storise = response.data
        console.log(this.storise)
      })
      .catch((e) => {
        console.log(e)
        this.$message.error('ストーリの取得に失敗しました！')
      })
  },
  methods: {
    sendStory () {
      if (this.story.date !== '') {
        this.axios.post(this.$store.state.apiBaseURL + 'stories/create', {
          content: this.story.content,
          date: this.story.date,
          acquaintancesid: this.info.id
        },
        {
          headers: {
            'Content-Type': 'application/json',
            Authorization: 'Bearer ' + this.$store.state.userinfo.token
          }
        })
          .then((response) => {
            this.$notify({
              title: 'Success',
              message: '登録にに成功しました！',
              type: 'success'
            })
          })
          .catch((e) => {
            this.$message.error('登録に失敗しました！' + e)
          })
      }
      this.axios.get(this.$store.state.apiBaseURL + 'stories/index', {
        params: {
          acquaintancesid: this.info.id
        },
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + this.$store.state.userinfo.token
        }
      })
        .then((response) => {
          console.log('更新')
          this.storise = response.data
        })
        .catch((e) => {
          console.log(e)
          this.$message.error('ストーリの取得に失敗しました！')
        })
    }
  },
  components: {
  }
}
</script>
<style scoped>
  .basicData{
    width: 70%;
    margin: 2vh auto;
    border-radius: 10px;
    padding: 5px 10px;
    background-color: rgb(184, 255, 238);
  }
  .timeline{
    width: 50%;
    margin: 0 auto;
  }
</style>
