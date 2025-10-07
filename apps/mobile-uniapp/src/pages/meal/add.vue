<template>
  <view class="p-4" style="display:flex;flex-direction:column;gap:12px;">
    <input v-model="foodId" placeholder="foodId（临时手填或粘贴Studio里的id）" />
    <input v-model.number="grams" type="number" placeholder="克数" />
    <button @click="submit">提交记录</button>
    <text style="color:#888">{{ msg }}</text>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import http from '@/utils/http'

const foodId = ref('')
const grams = ref<number | null>(150)
const msg = ref('提示：foodId 可在 prisma studio 的 Food 里复制')

async function submit() {
  try {
    const takenAt = new Date().toISOString()
    await http.post('/meals', { takenAt, items: [{ foodId: foodId.value, grams: grams.value || 0 }] })
    msg.value = '已提交成功！'
  } catch (e:any) {
    msg.value = '提交失败：' + (e?.response?.data?.message || e.message)
  }
}
</script>
