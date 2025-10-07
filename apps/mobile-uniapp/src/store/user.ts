import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    token: '',
    profile: null as any
  }),
  actions: {
    setToken(t: string) { this.token = t },
    setProfile(p: any) { this.profile = p }
  }
})
