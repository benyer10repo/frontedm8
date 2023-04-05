<template>
    <div class="row" style="text-align: left;">
        
       <div class="col-12 text-center">
        <h1>Gestionar Productos</h1>
       </div> 
    </div>
    <br>
    <div class="row">
    <div class="col-1">

    </div>
    <div class="col-2">
        <NuevoProducto :inpayload="payload" @on-payload="crearProducto($event)">
        </NuevoProducto>
    </div>
    <div class="col-3">
        <div class="input-group ">
            <input type="search" autocomplete="off" class="form-control" placeholder="Buscar por nombre" aria-label="Recipient's username" aria-describedby="button-addon2" v-model="search" @keypress.enter="getProducto()" @search="getProducto()">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2" @click="getProducto()"><i class="fa-solid  fa-search"></i> Buscar</button>
        </div>
    </div>
    
    </div>
<br>
    <div class="row">
        <div class="col-1"></div>
        <div class="col-6" style="text-align: left;">
            <label for="customRange1" class="form-label">Precio Menor y/o Igual A : {{ range }} </label>
            <input type="range" class="form-range" id="customRange1" min="0" max="300" step="1" v-model="range" >
        </div>
    </div>

    <div class="row">
    <div class="col-1"></div>
    <div class="col-8">
        <table class="table table-hover table-bordered border-primary">
  <thead class="table-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Producto</th>
      <th scope="col">Precio</th>
      <th scope="col">Stock</th>
      <th scope="col">Descripción</th>
      <th scope="col">Opciones</th>
    </tr>
  </thead>
  <tbody>
    <tr v-show="pro.precio <= range" v-for="(pro, key) in productos" id="key">
      <th scope="row">{{pro.id}}</th>
      <td>{{ pro.nombre }}</td>
      <td>{{ pro.precio }}</td>
      <td>{{ pro.stock }}</td>
      <td>{{ pro.descripcion }}</td>
      <td>
        <button type="button" class="btn btn-outline-success" @click="editar(pro)"><i class="fa-solid  fa-pencil"></i> Editar</button>
        <button type="button" class="btn btn-outline-danger" @click="eliminar(pro)"><i class="fa-solid  fa-trash"></i> Eliminar</button>

      </td>
    </tr>
  </tbody>
</table>
    </div>
</div>
</template>

<script>
import NuevoProducto from '@/components/NuevoProducto.vue'

export default {
    name: 'ProductosView',
    props: [],
    emits: [],
    data() {
        return {
            range: 300,
            search:"",
            productos:[],
            payload:{
                    nombre: "",
                    descripcion: "",
                    stock: 0,
                    precio: 0,
                    categoriaId: null
                }
        }
    },
    methods: {
        
        getProducto() {

            this.axios.get("http://localhost:5000/Producto?nombre_like="+ this.search)
                .then((response) => { this.productos = response.data; })
                .catch((err) => { console.log(err) })
        },
        crearProducto(payload){
            this.axios.post("http://localhost:5000/Producto",payload)
            .then((response)=>{
                this.productos.push(response.data);
                this.payload={
                    nombre: "",
                    descripcion: "",
                    stock: 0,
                    precio: 0,
                    categoriaId: null
                };
                this.getProducto();
                
            })
            .catch((err)=>{console.log(err)})
            console.log(this.payload);
        },
        editar(item){
            this.$router.push('/productos/'+item.id+'/editar');
            console.log(item);
        },
        eliminar(item){
            this.axios.delete("http://localhost:5000/Producto/"+item.id)
            .then((response)=>{console.log(response);this.getProducto();})
            .catch((err)=>{console.log(err)})
        }
        
    },
    computed: {
    },
    mounted() {
        
            this.getProducto();
            
    },
    components: {
        NuevoProducto
    }
}

</script>