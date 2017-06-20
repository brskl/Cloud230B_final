// UploadImageFile.sh
// Metadata
//  Content-Type=image/png or image/jpeg (added automatically if extension is lower-case jpg or png)
//  custom metadata prefixed in S3 object with 'x-amz-meta-' in S3 console
//  w=<width>, h=<height>, src=<src URL>
// to retrieve metadata: 'aws s3api head-object --bucket benjaminsklar-celebrity-images --key 2f34f9d1-5142-400a-9f9c-a90580b80059.jpg > headobject-2f34f9d1-5142-400a-9f9c-a90580b80059.jpg.json'

// Bill Clinton
aws s3 cp 2f34f9d1-5142-400a-9f9c-a90580b80059.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=2053,h=3000,src='http://images.closerweekly.com/uploads/posts/image/52886/bill-clinton.jpg'"
aws s3 cp d8f3ff79-9c94-4edf-89e0-9a38da7850c1.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=948,h=933,src='http://thefederalist.com/wp-content/uploads/2015/03/Bill-Clinton-Photo.jpg'"

// Barack Obama
aws s3 cp e8851dfd-9c7c-4f06-9570-75acb81e77ea.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=615,h=769,src='http://usinfonews.com/wp-content/uploads/2017/02/Barack-Obama.jpg'"
aws s3 cp 580ab9fa-4155-41f1-b81a-3688e452e04c.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=650,h=400,src='http://i.ndtvimg.com/i/2015-12/barack-obama-afp_650x400_61450947679.jpg'"

// Bill Clinton and Barack Obama
aws s3 cp 9107f8fc-3b58-461d-8d21-85c972c9e225.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=1200,h=780,src='https://wittymisfitsinc.files.wordpress.com/2014/11/former-pres-bill-clinton-and-president-obama.jpg'"

