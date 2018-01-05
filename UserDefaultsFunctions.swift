//UserDefaults per salvare un'immagine che viene passata come parametro
func saveImage(image_da_salvare: UIImage){
    let ud = UserDefaults.standard
    //converto l'image in NSData
    let saveImage = UIImageJPEGRepresentation(image_da_salvare, 1.0) as NSData?
    //decido la key in cui salvare l'image convertita in NSData
    ud.set(saveImage, forKey: "imageSalvata")
    // Salvo e controllo che tutto avvenga correttamente
    checkSave(ud: ud)
}
//chiamo la funzione per recuperare i NSData dell'immagine
func getImage() -> NSData{
    let ud = UserDefaults.standard
    let sfondo_data = ud.data(forKey: "imageSalvata")
    return sfondo_data! as NSData
    
}

// funzione che salva e controlla il risultato del salvataggio
func checkSave(ud: UserDefaults){
    let checkSave = ud.synchronize()
    if !checkSave{
        // se non ha salvato
        print("Errore durante il salvataggio Preferences could not be saved!")
    }
}

//Esempio di utilizzo

//dichiaro questa ipotetica imageView solo a scopo didattico
let img : UIImageView()

//chiamo la funzione per salvare una image
saveImage(image_da_salvare: img.image)

//recupero l'immagine precedentemente salvata e l'assegno ad un'altra image
let img_ritornata= UIImage(data: getImage() as Data)
