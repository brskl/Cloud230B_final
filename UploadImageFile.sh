// UploadImageFile.sh
// Metadata
//  Content-Type=image/png or image/jpeg
//  custom metadata prefixed in S3 object with 'x-amz-meta-'
//  w=<width>, h=<height>, src=<src URL>
// to retrieve metadata: 'aws s3api head-object --bucket benjaminsklar-celebrity-images --key 2f34f9d1-5142-400a-9f9c-a90580b80059.jpg > headobject-2f34f9d1-5142-400a-9f9c-a90580b80059.jpg.json'

// Bill Clinton
aws s3 cp 2f34f9d1-5142-400a-9f9c-a90580b80059.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=2053,h=3000,src='http://images.closerweekly.com/uploads/posts/image/52886/bill-clinton.jpg'"