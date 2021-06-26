<template>
  <div>{{x}}</div>
  <div>{{y}}</div>
  <div>{{isDark}}</div>
  <div>{{store}}</div>
</template>

<script lang="ts">
import { useMouse, usePreferredDark, useLocalStorage } from '@vueuse/core'

export default {
  setup() {
    // tracks mouse position
    const { x, y } = useMouse()

    // is user prefers dark theme
    const isDark = usePreferredDark()

    // persist state in localStorage
    const store = useLocalStorage(
      'my-storage',
      {
        name: 'Apple',
        color: 'red',
      },
    )

    return { x, y, isDark, store }
  }
}
</script>

<style>

</style>