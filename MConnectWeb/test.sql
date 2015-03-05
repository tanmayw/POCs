select * from category,subcategory,tabemployeecontribution
where category.categoryId = subcategory.categoryId
and   subcategory.subcategoryId = tabemployeecontribution.subcategoryId

select * from subcategory 
left outer join tabemployeecontribution on  subcategory.subcategoryId=tabemployeecontribution.subcategoryId
left outer join tabeventspictures on subcategory.subcategoryId = tabeventspictures.subcategoryid
left outer join tabfromtheshows on subcategory.subcategoryId = tabfromtheshows.subcategoryid
left outer join tabinthenews on subcategory.subcategoryId = tabinthenews.subcategoryid

select * from tabinthenews;

select * from tabuser where userName='ADMIN'

select tabuser0_.userId as userId10_, tabuser0_.isTermsAccepted as isTermsA2_10_, tabuser0_.token as token10_, tabuser0_.userName as userName10_, tabuser0_.userType as userType10_ from tabuser tabuser0_ where tabuser0_.userName='ADMIN'