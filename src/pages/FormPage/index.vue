<template>
  <div :class="styles.wrapper">
    <div :class="styles.card">
      <h2 :class="styles.title">Форма ввода</h2>
      <form :class="styles.form" @submit.prevent="submitForm">
        <div class="field">
          <select
            v-model="form.city"
            @change="onCityChange"
            :class="[{ [styles.select]: true, [styles.error]: errors.city }]"
          >
            <option disabled value="">Выберите город</option>
            <option v-for="city in cities" :key="city.name" :value="city.name">
              {{ city.name }}
            </option>
          </select>
        </div>

        <div class="field">
          <select
            v-model="form.department"
            :class="[{ [styles.select]: true, [styles.error]: errors.department }]"
          >
            <option disabled value="">Выберите цех</option>
            <option v-for="dept in departments" :key="dept">{{ dept }}</option>
          </select>
        </div>

        <div class="field">
          <select
            v-model="form.employee"
            :class="[{ [styles.select]: true, [styles.error]: errors.employee }]"
          >
            <option disabled value="">Выберите сотрудника</option>
            <option v-for="emp in employees" :key="emp">{{ emp }}</option>
          </select>
        </div>

        <div class="field">
          <select
            v-model="form.brigade"
            :class="[{ [styles.select]: true, [styles.error]: errors.brigade }]"
          >
            <option disabled value="">Выберите бригаду</option>
            <option v-for="brigade in brigades" :key="brigade">{{ brigade }}</option>
          </select>
        </div>

        <div class="field">
          <select
            v-model="form.shift"
            :class="[{ [styles.select]: true, [styles.error]: errors.shift }]"
          >
            <option disabled value="">Выберите смену</option>
            <option v-for="shift in shifts" :key="shift">{{ shift }}</option>
          </select>
        </div>

        <button type="submit" :class="styles.button">Сохранить</button>
      </form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { useFormStore } from '@/entities/Form/model/formStore'
import styles from './FormPage.module.scss'

const router = useRouter()
const formStore = useFormStore()

const cities = [
  {
    name: 'Москва',
    departments: [
      {
        name: 'Цех A',
        employees: ['Иванов', 'Петров', 'Колесников', 'Юрьев'],
      },
      {
        name: 'Цех B',
        employees: ['Сидоров', 'Кузнецов', 'Петрягин', 'Говрилов'],
      },
      {
        name: 'Цех C',
        employees: ['Седаков', 'Маструшев', 'Ильин', 'Кресников'],
      },
      {
        name: 'Цех D',
        employees: ['Лебедев', 'Сафронов', 'Носов', 'Патрушев'],
      },
    ],
  },
  {
    name: 'Санкт-Петербург',
    departments: [
      {
        name: 'Цех A',
        employees: ['Иванов', 'Петров', 'Колесников', 'Юрьев'],
      },
      {
        name: 'Цех B',
        employees: ['Сидоров', 'Кузнецов', 'Петрягин', 'Говрилов'],
      },
      {
        name: 'Цех C',
        employees: ['Седаков', 'Маструшев', 'Ильин', 'Кресников'],
      },
      {
        name: 'Цех D',
        employees: ['Лебедев', 'Сафронов', 'Носов', 'Патрушев'],
      },
    ],
  },
  {
    name: 'Новгород',
    departments: [
      {
        name: 'Цех A',
        employees: ['Иванов', 'Петров', 'Колесников', 'Юрьев'],
      },
      {
        name: 'Цех B',
        employees: ['Сидоров', 'Кузнецов', 'Петрягин', 'Говрилов'],
      },
      {
        name: 'Цех C',
        employees: ['Седаков', 'Маструшев', 'Ильин', 'Кресников'],
      },
      {
        name: 'Цех D',
        employees: ['Лебедев', 'Сафронов', 'Носов', 'Патрушев'],
      },
    ],
  },
  {
    name: 'Волгоград',
    departments: [
      {
        name: 'Цех A',
        employees: ['Иванов', 'Петров', 'Колесников', 'Юрьев'],
      },
      {
        name: 'Цех B',
        employees: ['Сидоров', 'Кузнецов', 'Петрягин', 'Говрилов'],
      },
      {
        name: 'Цех C',
        employees: ['Седаков', 'Маструшев', 'Ильин', 'Кресников'],
      },
      {
        name: 'Цех D',
        employees: ['Лебедев', 'Сафронов', 'Носов', 'Патрушев'],
      },
    ],
  },
]

const brigades = ['Бригада 1', 'Бригада 2', 'Бригада 3', 'Бригада 4']

const shifts = ['1 смена', '2 смена', '3 смена']

const form = ref({
  city: '',
  department: '',
  employee: '',
  brigade: '',
  shift: '',
})

const errors = ref({
  city: false,
  department: false,
  employee: false,
  brigade: false,
  shift: false,
})

const selectedCity = computed(() => cities.find((c) => c.name === form.value.city))

const departments = computed(() => selectedCity.value?.departments.map((d) => d.name) || [])

const selectedDepartment = computed(() =>
  selectedCity.value?.departments.find((d) => d.name === form.value.department),
)

const employees = computed(() => selectedDepartment.value?.employees || [])

function onCityChange() {
  form.value.department = ''
  form.value.employee = ''
}

function validateForm() {
  errors.value.city = !form.value.city
  errors.value.department = !form.value.department
  errors.value.employee = !form.value.employee
  errors.value.brigade = !form.value.brigade
  errors.value.shift = !form.value.shift

  return !Object.values(errors.value).includes(true)
}

function submitForm() {
  if (validateForm()) {
    formStore.setForm(form.value)
    router.push('/result')
  }
}
</script>
