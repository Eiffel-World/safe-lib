indexing
	description: 
	
		"[
			 Instances of this class are graphics which have been prepared
			 for display on a specific device. That is, they are ready
			 to paint using methods such as <code>GC.drawImage()</code>
			 and display on widgets with, for example, <code>Button.setImage()</code>.
			
			 If loaded from a file format that supports it, an
			 <code>Image</code> may have transparency, meaning that certain
			 pixels are specified as being transparent when drawn. Examples
			 of file formats that support transparency are GIF and PNG.
			 
			 There are two primary ways to use <code>Images</code>. 
			 The first is to load a graphic file from disk and create an
			 <code>Image</code> from it. This is done using an <code>Image</code>
			 constructor, for example:
			 <pre>
			    Image i = new Image(device, "C:\\graphic.bmp");
			 </pre>
			 
			 A graphic file may contain a color table specifying which
			 colors the image was intended to possess. In the above example,
			 these colors will be mapped to the closest available color in
			 SWT. It is possible to get more control over the mapping of
			 colors as the image is being created, using code of the form:
			 <pre>
			    ImageData data = new ImageData("C:\\graphic.bmp"); 
			    RGB[] rgbs = data.getRGBs(); 
			    // At this point, rgbs contains specifications of all
			    // the colors contained within this image. You may
			    // allocate as many of these colors as you wish by
			    // using the Color constructor Color(RGB), then
			    // create the image:
			    Image i = new Image(device, data);
			 </pre>
			
			 Applications which require even greater control over the image
			 loading process should use the support provided in class
			 <code>ImageLoader</code>.
			
			 Application code must explicitely invoke the <code>Image.dispose()</code> 
			 method to release the operating system resources managed by each instance
			 when those instances are no longer required.
		]"
		
	author: ""
	date: "$Date: 2004/07/06 20:15:17 $"
	revision: "$Revision: 1.1 $"

deferred class
	
	ABSTRACT_IMAGE

feature -- Access

	type : INTEGER
	
	device : DEVICE
	
	transparent_pixel : INTEGER is
		deferred
		end
		
	mem_gc : GC

		
feature -- Measurement

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_mem_gc (a_gc : GC) is
		require
			a_gc_not_void: a_gc /= Void
		do
			mem_gc := a_gc
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class ABSTRACT_IMAGE
