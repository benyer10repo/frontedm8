<template>
    <div class="row">

        <div class="col-12 text-center">
            <h1>Gestionar Categorias</h1>
            <br>
        </div>
        
        
        <div class="row">
            <div class="col-1"></div>
            <div class="col-6">
                <ListCategorias ref="componente"/>
            </div>
            <div class="col-1"></div>
            <div class="col-3">
                <NuevoCategoria :inpayload="payload" @on-payload="crearCategoria($event)"/>
            </div>
            <div class="col-1"></div> 
        </div>

    </div>
</template>


<script>
// @ is an alias to /src
import NuevoCategoria from '@/components/NuevoCategoria.vue'
import ListCategorias from '@/components/ListCategorias.vue'


export default {
    name: 'CategoriasView',
    props: [],
    emits: [],
    data() {
        return {
            
            payload:{
                    nombre: "",
                    descripcion: ""
                }
        }
    },
    methods: {
        
        crearCategoria(payload){
            this.axios.post("http://localhost:5000/Categoria",payload)
            .then((response)=>{
                
                this.payload={
                    nombre: "",
                    descripcion: ""
                };
                this.$refs.componente.getCategoria();
                //aqui llamamos a metodo de otro compente 
                
            })
            .catch((err)=>{console.log(err)})
            console.log(this.payload);
        }
        
    },
    computed: {
    },
    mounted() {
            
    },
    components: {
        NuevoCategoria,
        ListCategorias
    }
}


</script>