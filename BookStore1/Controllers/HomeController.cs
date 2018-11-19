using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookStore1.Models;

namespace BookStore1.Controllers
{
    public class HomeController : Controller
    {
       
        
        //Criar context da Dados
        BookContext db = new BookContext();

        public ActionResult Index()
        {
            //Tdos objectos Book, vao ser recebidos apartir da BD
            var books = db.Books; //db.Books - eh uma propriedade q xta no Model "BookContext"
            //Vamos transferir tds objectos na propriedade dinamica (Book) para ViewBag
            // IEnumerable<Book> books = db.Books;
            ViewBag.Books = books;

            return View(); //Retornar o View
        }

        [HttpGet]
        public ActionResult Buy(int id)
        {
            ViewBag.BookId = id;
            return View();
        }

        [HttpPost]
        public string Buy(Purchase purshase)
        {
            purshase.Date = DateTime.Now;
            //Adicionar informações padronizada da compra ao BD
            db.Purchases.Add(purshase);
            //Guardar no BD tdas alteracoes
            db.SaveChanges();
            return "Obrigado " + purshase.Person + "pela compra";
        }
    }
}