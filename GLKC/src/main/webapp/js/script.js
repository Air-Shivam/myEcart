function add_to_cart(pid,pname,price){
	
	let cart=localStorage.getItem("cart");
	
	if(cart==null){
		//no cart available
		let products=[];
		
		let product={productId:pid, productName:pname,
		             productQuantity:1,productPrice:price}
		
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("product added")
	}else{
		//card already present
		let pcart=JSON.parse(cart);
		let oldProduct=pcart.find((item) => item.productId==pid)
		if(oldProduct){
			//if we got the oldproduct then we have to increse the value in cart 
			oldProduct.productQuantity=oldProductQuantity+1;
			pcart.map((item) =>{
				if(item.productId=oldProduct.productId){
					item.productQuantity=oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("item Incresed")
		}else{
			//we have to add new item in the cart
			
			let product={productId:pid, productName:pname,
		             productQuantity:1,productPrice:price}
		
	        pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			
		}
	}
	
}