import axios from 'axios'
import { useUserStore } from '@/store/user'

const http = axios.create({
  baseURL: 'http://127.0.0.1:3000',   // ← 改成 127.0.0.1
  timeout: 15000                      // ← 超时加到 15 秒
})

http.interceptors.request.use((cfg) => {
  const u = useUserStore()
  if (u.token) {
    cfg.headers = cfg.headers || {}
    cfg.headers.Authorization = `Bearer ${u.token}`
  }
  return cfg
})

export default http
