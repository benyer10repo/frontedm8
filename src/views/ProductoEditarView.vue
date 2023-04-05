
<template>
    <div class="col-12" style="text-align: center;">
        <h4 style="font-weight: bolder;">Editar Producto</h4>
    </div>

    <div class="row">
    <div class="col-4"></div>
    <div class="col-4" style="text-align: left;">
        <form @submit.prevent="editar()">

            <div class="mb-3 col-auto">
                <label for="nombre" class="form-label">Nombre :</label>
                <input type="text" v-model="payload.nombre" class="form-control" placeholder="Nombre" autocomplete="off">
            </div>
            <div class="mb-3 col-auto">
                <label for="stock" class="form-label">Stock :</label>
                <input type="number" v-model="payload.stock" class="form-control" placeholder="Stock" autocomplete="off">
            </div>
            <div class="mb-3 col-auto">
                <label for="precio" class="form-label">Precio :</label>
                <input type="number" v-model="payload.precio" class="form-control" placeholder="Precio" autocomplete="off">
            </div>
            <div class="mb-3 col-auto">
                <label for="precio" class="form-label">Categoria :</label>
                <select class="form-select" aria-label="Default select example" required v-model="payload.categoriaId">
                    <option value=""  disabled selected>Seleccione una categoria</option>
                    <option v-for="cat in categoria" v-bind:value="cat.id">{{ cat.nombre }}</option>
                    
                </select>
            </div>
            <div class="mb-3 col-auto">
                <label for="descripcion" class="form-label">Descripción :</label>
                <input type="text" v-model="payload.descripcion" class="form-control" placeholder="Descripción" autocomplete="off">
            </div>
            <div>
                <button type="submit" class="btn btn-outline-primary"><i class="fa-solid fa-save"></i> GUARDAR</button>
            </div>
            
        </form>
    </div>
    <div class="col-4"></div>
    </div>
    
</template>


<script>
    export default {
        name: 'ProductoEditarView',
        props:[],
        emits:[],
        data(){
            return {
                categoria:[],
                productoId: 0,
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
            load(){
                this.productoId = this.$route.params.id;
            },
            getProducto(){
                
                this.axios.get("http://localhost:5000/Producto/"+this.productoId)
                .then((response)=>{this.payload = response.data})
                .catch((err)=>{console.log(err)})
            },
            editar(){
                this.axios.patch("http://localhost:5000/Producto/"+this.productoId,this.payload)
                .then((response)=>{
                    console.log(response);
                    this.$router.push('/productos');
                })
                .catch((err)=>{console.log(err)})
            },
            getCategoria() {
                this.axios.get("http://localhost:5000/Categoria")
                .then((response) => { this.categoria = response.data; })
                .catch((err) => { console.log(err) })
            }
        },
        computed: {
        },
        mounted(){
            this.load(),
            this.getProducto(),
            this.getCategoria()
        },
        components: {
        }
    }
</script>