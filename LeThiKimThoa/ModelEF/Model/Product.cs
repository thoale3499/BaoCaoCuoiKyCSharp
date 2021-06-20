namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [Required(ErrorMessage ="Vui lòng nhập mã sản phẩm")]
        [StringLength(10)]
        public string ID { get; set; }

        public int? ProTypeId { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm")]
        [StringLength(200)]
        public string Name { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập đơn giá của sản phẩm")]
        [StringLength(200)]
        public string UnitCost { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số lượng sản phẩm")]
        public int Quantity { get; set; }

        public string Image { get; set; }

        public string Description { get; set; }

        public Nullable<bool> Status { get; set; }

        public virtual Category Category { get; set; }
    }
}
