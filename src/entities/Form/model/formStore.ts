import { defineStore } from 'pinia'

export const useFormStore = defineStore('form', {
  state: () => ({
    city: '',
    department: '',
    employee: '',
    brigade: '',
    shift: '',
  }),
  actions: {
    setForm(data: any) {
      Object.assign(this, data)
    },
  },
})
