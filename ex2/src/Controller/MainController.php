<?php

namespace App\Controller;

use App\Entity\Movie;
use App\Entity\Session;
use App\Repository\SessionRepository;
use Doctrine\ORM\EntityManagerInterface;
use mysql_xdevapi\Collection;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class MainController extends AbstractController
{
    #[Route('/', name: 'app_main')]
    public function index(EntityManagerInterface $em, Request $request): Response
    {
        $sessionToday = [];
        $movieT = [];
        $today = new \DateTime('today');
        $order = $request->query->get('order', 'price');
        $allsesmov = $em->getRepository(Movie::class)->findAll();
        $allsession = $em->getRepository(Session::class)->findBy([],[$order => 'ASC']);
        foreach($allsession as $session){
            if($session->getDatetime()->format('Y-m-d') === $today->format('Y-m-d')){
                $sessionToday[] = $session;
            }
        }
        foreach ($allsesmov as $movie){
            $movieT[] = $movie->getSessions();
        }

        return $this->render('main/index.html.twig', [
            'moviee' => $movieT,
            'moviet' => count($movieT),
            'sessiontoday' => count($sessionToday),
            'allsession' => count($allsession),
            'sessionstoday' => $sessionToday,
            'sessionsall' => $allsession

        ]);
    }
}
