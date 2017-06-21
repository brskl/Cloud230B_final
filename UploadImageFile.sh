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

// Neve Campbell
aws s3 cp 7cbfa86e-16c1-4744-a27c-57046ab9371a.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=513,h=342,src='http://image.tmdb.org/t/p/w342/8FQFKQSvrlm752DJKPtX5HBONre.jpg'"
aws s3 cp da6f5cb8-eb68-463f-8cb0-ca44d510f53d.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=1280,h=1662,src='http://celebmafia.com/wp-content/uploads/2016/09/neve-campbell-emmy-awards-in-los-angeles-09-18-2016-3.jpg'"

// Jennifer Love Hewitt
aws s3 cp 4c5c0346-4145-4d92-bcce-c54c7e271293.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=1920,h=1080,src='http://wallpapersqq.net/wp-content/uploads/2016/03/jennifer-love-hewitt-image-hd-2016.jpg'"
aws s3 cp 8b0221a0-34e0-4cee-8d22-76aad535e3b2.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=740,h=1110,src='http://iv1.lisimg.com/image/3760781/740full-jennifer-love-hewitt.jpg'"
aws s3 cp 47d39e0d-575e-4488-9b66-9100bd50dd63.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=380,h=600,src='https://s-media-cache-ak0.pinimg.com/736x/85/37/14/8537148d786aa3f832ec3791db472efd.jpg'"
aws s3 cp 49beab04-d4fc-41ec-bbdd-25e1be886d64.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=713,h=1024,src='http://media.gettyimages.com/photos/actress-jennifer-love-hewitt-attends-the-party-of-five-cast-meet-on-picture-id453736603'"
aws s3 cp bbe01a85-dda6-4e80-a00f-2f04bd9d9ef0.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=450,h=253,src='http://cdn-img.instyle.com/sites/default/files/styles/684xflex/public/images/2015/WRN/010815-jennifer-love-hewitt-594.jpg?itok=xPFe7Pqf'"

// Matthew Fox
aws s3 cp ccafe8e1-d7ce-4190-81a2-87960ba253c6.png s3://brskl-celebrity-images/ --acl public-read --metadata "w=417,h=493,src='http://gazettereview.com/wp-content/uploads/2015/06/matthew-fox-young.png'"






// Kaley Cuoco
aws s3 cp a103fa11-44ba-4eee-bdad-8754ab41656a.jpg s3://brskl-celebrity-images/ --acl public-read --metadata "w=1800,h=2700,src='https://image.tmdb.org/t/p/original/rlt7XJ0dWik2oReZlxOPLI1L7Vt.jpg'"


