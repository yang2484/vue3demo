<template>
  <div class="nav_group">
    <div v-for="item in list" @click="change(item)">{{item.text}}</div>
  </div>
  <hr>
  <div class="content">
    <keep-alive>
      <component :is="currentTabComponent"></component>
    </keep-alive>
  </div>
</template>

<script lang="ts">

import { ref, defineComponent  } from 'vue'
import one from './components/one.vue'
import two from './components/two.vue'
import { componentsList } from './interface'

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
    const componentsList: componentsList[] = [
      {text: '单例模式', components: 'one'},
      {text: '单例模式1', components: 'two'}
    ]
    const list = ref(componentsList)
    const currentTabComponent = ref('')

    return {
      list,
      currentTabComponent
    }
  },
  methods: {
    change(e: componentsList) {
      this.currentTabComponent = e.components
    }
  }
})
</script>

<style>
  .nav_group {
    display: flex;
  }
  .nav_group div {
    margin-right: 10px;
    cursor: pointer;
  }
  .nav_group div:last-child {
    margin-right: 0px;
  }
  .content {
    margin-top: 10px;
  }
</style>
