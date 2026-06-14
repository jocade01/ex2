<?php

namespace App\Controller;

use App\Entity\Movie;
use App\Entity\Session;
use App\Repository\SessionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;


    #[Route('/api/cartelera', name: 'app_api_cartelera')]
class ApiCarteleraController extends AbstractController
 {
    #[Route('', methods: ['GET'], name: 'list')]
    public function list(Request $request, EntityManagerInterface $em): JsonResponse
    {
        $movies = $em->getRepository(Movie::class)->findAll();
        $data = [];
        foreach ($movies as $movie) {
            $sessions = $em->getRepository(Session::class)->findBy(['movie' => $movie->getId()]);
            $d = [];
            foreach ($sessions as $session) {
                    $d[] = [
                        'datetime' => $session->getDatetime()->format('Y-m-d H:i:s'),
                        'room' => $session->getRoom(),
                        'price' => $session->getPrice(),
                    ];

            }
            if($d) {
                $data[] = [
                    'title' => $movie->getTitle(),
                    'genre' => $movie->getGenre(),
                    'session' => $d,
                ];
            }
        }

        return new JsonResponse($data);

    }
}
