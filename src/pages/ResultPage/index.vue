<template>
  <div :class="styles.wrapper">
    <div :class="styles.card">
      <h2 :class="styles.title">Результат ввода</h2>
      <ul :class="styles.list">
        <li v-for="(value, key) in formattedData" :key="key">
          <span class="label">{{ key }}:</span>
          <span class="value">{{ value }}</span>
        </li>
      </ul>
      <button :class="styles.button" @click="goBack">Назад</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { useFormStore } from '@/entities/Form/model/formStore'
import styles from './ResultPage.module.scss'

const form = useFormStore()
const router = useRouter()

const formattedData = {
  Город: form.city,
  Цех: form.department,
  Сотрудник: form.employee,
  Бригада: form.brigade,
  Смена: form.shift,
}

function goBack() {
  router.push('/')
}
</script>
