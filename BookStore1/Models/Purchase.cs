using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BookStore1.Models
{
    public class Purchase
    {
        //Id da pasta
        [Key]
        public int Id { get; set; }
        //Nome completo do comoprador
        public string Person { get; set; }
        //Endereco d comprador
        public string Address { get; set; }
        //Id do livro
        public int IdBokk { get; set; }
        //Data dsa compora
        public DateTime Date { get; set; }
    }
}