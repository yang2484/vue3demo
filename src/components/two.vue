<template>
  <div>123</div>
</template>
  
<script lang="ts">
import { defineComponent, onMounted } from 'vue'
interface Obj {
  new (name: string): any;
  getName: Function;
}
// class Oo {
//   getName: Function
// }
export default defineComponent({
  name: 'one',
  setup(...data) {
    // class Singleton {
    //   constructor() {

    //   }
    // }
    // console.log(123)
    // function Singleton() {
    //   let instance: any = null
    //   const obj = function(this: any, name: string){
    //     this.name = name
    //   } as any as Obj
    //   obj.prototype.getName = function(){return this.name}
    //   return function(str: string) {
    //     if(!instance) {
    //       instance = new obj(str)
    //     }
    //     return instance
    //   }
    // }
    // const a = Singleton()
    // const aa: Obj = a('1')
    // const bb = a('2')
    // console.log(aa === bb, aa.getName(), bb)
    // return {}
    console.log(data)
    // onMounted(function(this: any) {
    //   console.log(1,this)
    // })
    // this.one()
  },
  mounted() {
    this.one()
  },
  methods: {
    one() {
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
      console.group('单例模式1', CreateUser, ProxyMode)
    }
  }
});
</script>
  
<style>
</style>