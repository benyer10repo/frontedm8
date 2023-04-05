<template>
    <div class="card text-dark bg-light ">
        <div class="card-body">
            <h5 class="card-title" style="font-weight: bold;">Agregar Categoria</h5>

        <form style="text-align: left;"  @submit.prevent="crearCategoria()">
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

    
</template>

<script>


export default {
        name: 'NuevoCategoria',
        props:{inpayload:{},
                mode_edit:{
                    type: Boolean,
                    default: false
                }
        },
        emits:["on-payload"],
        data(){
            return {
                payload:{
                    nombre: "",
                    descripcion: ""
                }
            }
        },
        methods: {
            crearCategoria(){
                this.$emit('on-payload',this.payload);

                if(!this.mode_edit){
                    this.payload={
                    nombre: "",
                    descripcion: ""
                    };
                    
                }
            }
        },
        computed: {
        },
        mounted(){
            this.payload = this.inpayload;
        },
        components: {
        }
    }

</script>