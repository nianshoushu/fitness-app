<template>
  <view class="p-4" style="display:flex;flex-direction:column;gap:12px;">
    <text>今日摄入（估算/100g换算）</text>
    <text>热量：{{ s.kcal }} kcal</text>
    <text>蛋白质：{{ s.protein }} g</text>
    <text>脂肪：{{ s.fat }} g</text>
    <text>碳水：{{ s.carbs }} g</text>
    <button @click="toAdd">去记录一顿饭</button>
  </view>
</template>

<script setup lang="ts">
import { reactive, onMounted } from 'vue'          // ← 用 onMounted
import http from '@/utils/http'

const s = reactive({ kcal: 0, protein: 0, fat: 0, carbs: 0 })

async function load() {
  const { data } = await http.get('/stats/today')
  Object.assign(s, data)
}

function toAdd() {
  uni.navigateTo({ url: '/pages/meal/add' })
}

onMounted(load)                                   // ← 首次进入页面时加载
</script>
