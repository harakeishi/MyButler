<template>
  <div class="signup">
    <h1>新規登録</h1>
    <div class="loginForm">
      <table>
        <tr>
          <th>ID</th>
          <td><el-input placeholder="Please input" v-model="id"></el-input></td>
        </tr>
        <tr>
          <th>パスワード</th>
          <td><el-input placeholder="Please input password" v-model="pass" show-password></el-input></td>
        </tr>
      </table>
      <el-button type="primary" @click="dologin">新規登録</el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'signup',
  data () {
    return {
      id: '',
      pass: ''
    }
  },
  components: {
  },
  methods: {
    dologin () {
      this.axios.post(this.$store.state.apiBaseURL + 'users/', {
        name: this.id,
        pwd: this.pass
      },
      {
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then((response) => {
          this.$store.dispatch('doRegistrationToken', response.data.token)
          this.$notify({
            title: 'Success',
            message: '登録に成功しました！',
            type: 'success'
          })
          this.$router.push('/login')
        })
        .catch((e) => {
          console.log(e)
          this.$notify.error({
            title: 'Error',
            message: '登録に失敗しました。'
          })
        })
    }
  }
}
</script>
<style scoped>
  .loginForm{
    width: 80%;
    padding: 10vh 5vw;
    margin: auto;
    background-size: cover;
  }
  .loginForm *{
    margin: auto;
  }
</style>
