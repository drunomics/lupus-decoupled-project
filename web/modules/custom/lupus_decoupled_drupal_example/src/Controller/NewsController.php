<?php

namespace Drupal\lupus_decoupled_drupal_example\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\custom_elements\CustomElement;

/**
 * Returns responses for Lupus Decoupled Drupal Example routes.
 */
class NewsController extends ControllerBase {

  /**
   * Builds the response.
   */
  public function buildNewsListing() {
    $articles[] = CustomElement::create('article-teaser')
      ->setAttribute('href', 'https://example.com/news/1')
      ->setAttribute('excerpt', 'The excerpt of the news entry.');
    $articles[] = CustomElement::create('article-teaser')
      ->setAttribute('href', 'https://example.com/news/2')
      ->setAttribute('excerpt', 'The excerpt of another news entry.');

    $teaser_listing = CustomElement::create('teaser-listing')
      ->setAttribute('title', 'Latest news')
      ->setAttribute('icon', 'news')
      ->setSlotFromNestedElements('default', $articles);

    // lupus_ce_renderer module will take care of rendering the custom elements.
    return $teaser_listing;
  }

}
