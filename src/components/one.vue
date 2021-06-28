<template>
  <div>
    <div>
      单例模式： 多次调用返回同一个实例
    </div>
    <div>
      TS
      <Markdown :source="html" />
    </div>
  </div>
</template>
  
<script lang="ts">
import { defineComponent, onMounted } from 'vue'
class CreateUser {
  name: string;
  constructor(name: string) {
      this.name = name;
  }
  getName() {
      return this.name;
  }
}
export default defineComponent({
  name: 'one',
  setup(...data) {
    console.log(data)
  },
  data() {
    return {
      html:
      `
\`\`\`
  class CreateUser {
    name: string;
    constructor(name: string) {
        this.name = name;
    }
    getName() {
        return this.name;
    }
  }
  // 代理实现单例模式
  var ProxyMode = (function() {
    var instance: CreateUser | null = null;
    return function(name: string) {
        if(!instance) {
            instance = new CreateUser(name);
        }
        return instance;
    }
  } as any)();
  // 测试单体模式的实例
  var a = new ProxyMode("aaa");
  var b = new ProxyMode("bbb");
  // 因为单体模式是只实例化一次，所以下面的实例是相等的
  console.log(a === b);    //true
\`\`\`
      `
    }
  },
  mounted() {
    this.one()
  },
  methods: {
    one() {
      // 代理实现单例模式
      var ProxyMode = (function() {
        var instance: CreateUser | null = null;
        return function(name: string) {
            if(!instance) {
                instance = new CreateUser(name);
            }
            return instance;
        }
      } as any)();
      // 测试单体模式的实例
      var a = new ProxyMode("aaa");
      var b = new ProxyMode("bbb");
      // 因为单体模式是只实例化一次，所以下面的实例是相等的
      console.log(a === b);    //true
      console.group('单例模式', CreateUser, ProxyMode)
      console.groupEnd()
    }
  }
});
</script>
  
<style>
</style>