<template>
    
<!-- Modal -->
<div  class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">REGISTRAR PRODUCTO</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="text-align: left;">
        <form id="form" @submit.prevent="crearProducto()">

            <div class="mb-3 col-auto">
                <label for="nombre" class="form-label">Nombre :</label>
                <input type="text" v-model="payload.nombre" id="nombre" class="form-control" placeholder="Nombre" required autocomplete="off">
            </div>
            <div class="mb-3 col-auto">
                <label for="stock" class="form-label">Stock :</label>
                <input type="number" v-model="payload.stock" class="form-control" placeholder="Stock" required autocomplete="off">
            </div>
            <div class="mb-3 col-auto">
                <label for="precio" class="form-label">Precio :</label>
                <input type="number" v-model="payload.precio" class="form-control" placeholder="Precio" required autocomplete="off">
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
                <input type="text"  v-model="payload.descripcion" class="form-control" placeholder="Descripción" autocomplete="off">
            </div>

            

        </form>
      </div>
      <div class="modal-footer">
        <div>
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal"><i class="fa-solid  fa-remove"></i> CANCELAR</button>
                <button type="submit" form="form" class="btn btn-outline-primary" ><i class="fa-solid fa-save"></i> GUARDAR</button>
        </div>
        
      </div>
    </div>
  </div>
</div>

    

<div>

<!-- Button trigger modal -->
<button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
    <i class="fa-solid  fa-plus"></i> Nuevo
</button>

</div>

</template>


<script>
    export default {
        name: 'NuevoProducto',
        props:{inpayload:{},
                mode_edit:{
                    type: Boolean,
                    default: false
                }
        },
        emits:["on-payload"],
        data(){
            return {
                
                categoria:[],
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
            crearProducto(){
                this.$emit('on-payload',this.payload);

                if(!this.mode_edit){
                    this.payload={
                    nombre: "",
                    descripcion: "",
                    stock: 0,
                    precio: 0,
                    categoriaId: null
                    };
                    
                }
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
            this.payload = this.inpayload;
            this.getCategoria();
        },
        components: {
        }
    }
</script>