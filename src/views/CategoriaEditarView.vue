<template>
<div class="row">
    
    <div class="col-3"></div>
    <div class="col-6">
    <div class="card text-dark bg-light ">
        <div class="card-body">
            <h5 class="card-title" style="font-weight: bold;">Editar Categoria</h5>

        <form style="text-align: left;"  @submit.prevent="editar()">
            <div class="mb-3 col-auto">
                <label for="nombre" class="form-label">Nombre :</label>
                <input type="text" v-model="payload.nombre" id="nombre" class="form-control" placeholder="Nombre" required autocomplete="off">
            </div>
            <div class="mb-3 col-auto">
                <label for="descripcion" class="form-label">Detalle o Descripción :</label>
                <input type="text" v-model="payload.descripcion" id="descripcion" class="form-control" placeholder="descripcion" required autocomplete="off">
            </div>
            <div style="text-align: center;">
                <button type="submit"  class="btn btn-outline-primary" ><i class="fa-solid fa-save"></i> GUARDAR</button>
            </div>
        </form>
        </div>
    </div>
    </div>
    <div class="col-3"></div>
    
</div>
</template>


<script>
    export default {
        name: 'CategoriaEditarView',
        props:[],
        emits:[],
        data(){
            return {
                
                categoriaId: 0,
                payload:{
                    nombre: "",
                    descripcion: ""
                }
            }
        },
        methods: {
            load(){
                this.categoriaId = this.$route.params.id;
            },
            getCategoria(){
                
                this.axios.get("http://localhost:5000/Categoria/"+this.categoriaId)
                .then((response)=>{this.payload = response.data})
                .catch((err)=>{console.log(err)})
            },
            editar(){
                this.axios.patch("http://localhost:5000/Categoria/"+this.categoriaId,this.payload)
                .then((response)=>{
                    console.log(response);
                    this.$router.push('/categorias');
                })
                .catch((err)=>{console.log(err)})
            }
        },
        computed: {
        },
        mounted(){
            this.load(),
            this.getCategoria()
        },
        components: {
        }
    }
</script>