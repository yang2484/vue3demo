<template>
  <div v-for="item in list" @click="change(item)">{{item.text}}</div>
  <keep-alive>
    <component :is="currentTabComponent"></component>
  </keep-alive>
</template>

<script lang="ts">
interface list {
  components: string;
  text: string;
}
import { ref, defineComponent  } from 'vue'
import one from './components/one.vue'
import two from './components/two.vue'

export default defineComponent({
  name: 'App',
  components: {
    one,
    two
  },
  data() {
    return {
      // currentTabComponent: ''
    }
  },
  setup() {
    const a = [
      {text: '单例模式', components: 'one'},
      {text: '单例模式1', components: 'two'}
    ]
    const list = ref(a)
    const currentTabComponent = ref('')

    return {
      list,
      currentTabComponent
    }
  },
  methods: {
    change(e: list) {
      this.currentTabComponent = e.components
    }
  }
})
</script>
