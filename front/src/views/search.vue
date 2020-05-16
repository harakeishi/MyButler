<template>
  <div class="search">
    <table>
      <tr>
        <td>
          <el-input
            placeholder="名前か、あだ名で検索"
            v-model="searchtext"
            clearable>
          </el-input>
        </td>
        <td>
          <el-button type="primary" icon="el-icon-search" @click="send">検索</el-button>
        </td>
        <td>
          <router-link to="/new_acquaintance">
            <el-button type="warning"><i class="el-icon-plus">登録</i></el-button>
          </router-link>
        </td>
      </tr>
    </table>
    <el-table
       :data="acqdata"
       stripe
       @row-click="user"
       style="width: 100%">
       <el-table-column
         prop="name"
         label="名前"
         width="180">
       </el-table-column>
       <el-table-column
         prop="nickname"
         label="あだ名"
         width="180">
       </el-table-column>
     </el-table>
  </div>
</template>

<script>

export default {
  name: 'search',
  data () {
    return {
      searchtext: '',
      acqdata: {
        name: '',
        nickname: ''
      }
    }
  },
  components: {
  },
  mounted () {
    this.axios.get(this.$store.state.apiBaseURL + 'acquaintances/', {
      params: {
        user_id: this.$store.state.userinfo.id
      },
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + this.$store.state.userinfo.token
      }
    })
      .then((response) => {
        this.acqdata = response.data
      })
      .catch((e) => {
        console.log(e)
        this.$message.error('情報取得に失敗しました！' + e)
      })
  },
  methods: {
    user (val) {
      this.$store.dispatch('doRegistrationAcqUser', val)
      this.$router.push('/acquaintanceInfo')
    },
    send () {
      this.axios.get(this.$store.state.apiBaseURL + 'acquaintance/search', {
        params: {
          user_id: this.$store.state.userinfo.id,
          name: this.searchtext,
          nickname: this.searchtext
        },
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + this.$store.state.userinfo.token
        }
      })
        .then((response) => {
          this.acqdata = response.data
        })
        .catch((e) => {
          console.log(e)
          this.$confirm('新しく登録しますか？', 'ユーザーが見つかりませんでした。', {
            confirmButtonText: 'OK',
            cancelButtonText: 'Cancel',
            type: 'warning'
          }).then(() => {
            this.$router.push('new_acquaintance')
          }).catch(() => {
          })
        })
    }
  }
}
</script>
<style scoped>
  .search{
    width: 70%;
    margin: 3vh auto;
  }
  table{
    width: 100%;
  }
</style>
