<template>
  <view class="p-4" style="display:flex;flex-direction:column;gap:12px;">
    <input v-model="phone" placeholder="手机号" />
    <input v-model="password" placeholder="密码" password />
    <button @click="onSubmit">登录/注册</button>
    <text style="color:#888">{{ tip }}</text>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import http from '@/utils/http'
import { useUserStore } from '@/store/user'

const phone = ref('13800000000')
const password = ref('123456')
const tip = ref('请输入手机号和密码')
const user = useUserStore()

async function onSubmit() {
  try {
    // 先确保已注册（幂等）
    await http.post('/auth/register', { phone: phone.value, password: password.value })
    // 再登录
    const res = await http.post('/auth/login', { phone: phone.value, password: password.value })
    user.setToken(res.data.token)
    tip.value = '登录成功，正在进入首页...'
    // 跳转首页
    uni.reLaunch({ url: '/pages/index/index' })
  } catch (e: any) {
    tip.value = '登录失败：' + (e?.response?.data?.message || e.message)
  }
}
</script>
