<template>
  <div class="new_acquaintance">
    <h1>知り合い登録</h1>
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="120px" class="demo-ruleForm">
      <el-form-item label="氏名" prop="name">
        <el-input v-model="ruleForm.name"></el-input>
      </el-form-item>
      <el-form-item label="あだ名" prop="nickname">
        <el-input v-model="ruleForm.nickname"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">Create</el-button>
        <el-button @click="resetForm('ruleForm')">Reset</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>

export default {
  name: 'new_acquaintance',
  data () {
    return {
      ruleForm: {
        user_id: this.$store.state.userinfo.id,
        name: '',
        nickname: ''
      },
      rules: {
        name: [
          { required: true, message: '名前を入力してください', trigger: 'blur' },
          { min: 1, max: 20, message: '1文字から20文字で入力してください', trigger: 'blur' }
        ]
      }
    }
  },
  components: {
  },
  methods: {
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.axios.post('http://0.0.0.0:3000/acquaintances/', {
            user_id: this.ruleForm.user_id,
            name: this.ruleForm.name,
            nickname: this.ruleForm.nickname
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
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    resetForm (formName) {
      this.$refs[formName].resetFields()
    }
  }
}
</script>
<style scoped>
</style>
