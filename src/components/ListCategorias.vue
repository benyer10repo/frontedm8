<template>
    <div class="row">
        <div class="col-6">
        <div class="input-group">
            <input type="search" autocomplete="off" class="form-control" placeholder="Buscar por nombre" aria-label="Recipient's username" aria-describedby="button-addon2" v-model="search" @keypress.enter="getCategoria()" @search="getCategoria()">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2" @click="getCategoria()"><i class="fa-solid  fa-search"></i> Buscar</button>
        </div>
        </div>
    </div>
    <br>
    <div class="row">
        
        <div class="col-6" style="text-align: left;">
            <label for="customRange1" class="form-label">Mostrar : {{ range }} Categorias</label>
            <input type="range" class="form-range" id="customRange1" min="0" max="20" step="1" v-model="range" >
        </div>
    </div>



    <div>
        <table class="table table-hover table-bordered border-primary">
            <thead class="table-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Categoria</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Opciones</th>
                </tr>
            </thead>
            <tbody>
                <tr v-show="cat.id <= range" v-for="(cat, key) in categorias" id="key">
                    <th scope="row">{{cat.id}}</th>
                    <td>{{ cat.nombre }}</td>
                    <td>{{ cat.descripcion }}</td>
                    <td>
        <button type="button" class="btn btn-outline-success" @click="editar(cat)"><i class="fa-solid  fa-pencil"></i> Editar</button>
        <button type="button" class="btn btn-outline-danger" @click="eliminar(cat)"><i class="fa-solid  fa-trash"></i> Eliminar</button>

                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>


export default {
    name: 'ListCategorias',
    props: [],
    emits: [],
    data() {
        return {
            range: 20,
            search:"",
            categorias:[]
        }
    },
    methods: {
        
        getCategoria() {

            this.axios.get("http://localhost:5000/Categoria?nombre_like="+ this.search)
                .then((response) => { this.categorias = response.data; })
                .catch((err) => { console.log(err) })
        },
        editar(item){
            this.$router.push('/categorias/'+item.id+'/editar');
            console.log(item);
        },
        eliminar(item){
            this.axios.delete("http://localhost:5000/Categoria/"+item.id)
            .then((response)=>{console.log(response);this.getCategoria();})
            .catch((err)=>{console.log(err)})
        }
        
    },
    computed: {
    },
    mounted() {
        
            this.getCategoria();
            
    },
    components: {
        
    }
}
</script>