output "storage_id" {
    value ={
        for key , stg_id in azurerm_storage_account.storage_account:
        key => stg_id.id 
    }  
}